```java
package com.nt.controller;

import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;

@RestController
public class AiAssistantController {

    private static final String API_URL =
            "https://generativelanguage.googleapis.com/v1beta/models/";

    private static final String[] MODELS = {
            "gemini-2.5-flash",
            "gemini-2.5-flash-lite"
    };

    private final HttpClient client = HttpClient.newHttpClient();

    @PostMapping(value = "/AiAssistant",
            produces = "application/json;charset=UTF-8")
    public Map<String, String> askAssistant(
            @RequestParam("question") String question) {

        System.out.println("AI QUESTION: " + question);

        Map<String, String> out = new HashMap<>();

        if (question == null || question.isBlank()) {
            out.put("reply", "Please enter a question.");
            return out;
        }

        String farmContext = buildFarmContext();

        String prompt =
                "You are a helpful assistant for a dairy farm management system. "
                + "Answer the user's question using ONLY the farm data provided. "
                + "If the required information is unavailable, clearly say so. "
                + "Do not invent cattle records, milk production, or farm statistics.\n\n"
                + "FARM DATA:\n" + farmContext
                + "\n\nQUESTION: " + question;

        String aiReply = callGemini(prompt);

        System.out.println("AI REPLY: " + aiReply);

        out.put("reply", aiReply);
        return out;
    }

    private String buildFarmContext() {
        StringBuilder sb = new StringBuilder();

        // TODO: Fetch actual cattle, milk production and health records
        // from your database using your DAO.

        sb.append("No farm records have been connected yet.");

        return sb.toString();
    }

    private String callGemini(String prompt) {

        String apiKey = System.getenv("GEMINI_API_KEY");

        if (apiKey == null || apiKey.isBlank()) {
            return "AI is not configured. Please set the GEMINI_API_KEY "
                    + "environment variable and restart the application.";
        }

        JSONObject part = new JSONObject()
                .put("text", prompt);

        JSONObject content = new JSONObject()
                .put("parts", new JSONArray().put(part));

        String body = new JSONObject()
                .put("contents", new JSONArray().put(content))
                .toString();

        for (String model : MODELS) {

            String url = API_URL + model
                    + ":generateContent?key=" + apiKey;

            long wait = 1500;

            for (int attempt = 1; attempt <= 3; attempt++) {

                try {
                    HttpRequest request = HttpRequest.newBuilder()
                            .uri(URI.create(url))
                            .header("Content-Type", "application/json")
                            .POST(HttpRequest.BodyPublishers.ofString(
                                    body, StandardCharsets.UTF_8))
                            .build();

                    HttpResponse<String> response = client.send(
                            request,
                            HttpResponse.BodyHandlers.ofString());

                    JSONObject json = new JSONObject(response.body());

                    if (response.statusCode() >= 200
                            && response.statusCode() < 300
                            && !json.has("error")) {

                        JSONArray candidates = json.optJSONArray("candidates");

                        if (candidates != null && !candidates.isEmpty()) {
                            JSONObject candidate = candidates.getJSONObject(0);
                            JSONObject responseContent =
                                    candidate.optJSONObject("content");

                            if (responseContent != null) {
                                JSONArray parts =
                                        responseContent.optJSONArray("parts");

                                if (parts != null && !parts.isEmpty()) {
                                    String text = parts.getJSONObject(0)
                                            .optString("text", "");

                                    if (!text.isBlank()) {
                                        return text;
                                    }
                                }
                            }
                        }

                        return "The AI service returned no answer. Please try again.";
                    }

                    JSONObject error = json.optJSONObject("error");

                    String status = error != null
                            ? error.optString("status", "")
                            : "";

                    String message = error != null
                            ? error.optString("message", "Unknown error")
                            : "HTTP error " + response.statusCode();

                    System.out.println("Gemini [" + model + "] attempt "
                            + attempt + ": " + status
                            + " (HTTP " + response.statusCode() + ")");

                    if (status.equals("NOT_FOUND")
                            || status.equals("INVALID_ARGUMENT")) {
                        break;
                    }

                    boolean retryable =
                            response.statusCode() == 429
                            || response.statusCode() >= 500
                            || status.equals("RESOURCE_EXHAUSTED")
                            || status.equals("UNAVAILABLE")
                            || status.equals("INTERNAL")
                            || status.equals("DEADLINE_EXCEEDED");

                    if (!retryable) {
                        return "AI error: " + message;
                    }

                    if (attempt < 3) {
                        Thread.sleep(wait);
                        wait *= 2;
                    }

                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    return "The AI request was interrupted. Please try again.";

                } catch (Exception e) {
                    System.err.println("Gemini request failed: "
                            + e.getMessage());
                    break;
                }
            }
        }

        return "The AI service is busy or unavailable right now. "
                + "Please try again later.";
    }
}
```