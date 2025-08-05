package com.example.college.app.controller;

import com.example.college.app.dto.EmbeddingRequest;
import com.example.college.app.service.FaceEmbeddingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/face")
public class FaceRecognitionController {

    @Autowired
    private FaceEmbeddingService faceEmbeddingService;

    @PostMapping("/store")
    public ResponseEntity<String> storeEmbedding(@RequestBody EmbeddingRequest request) {
        boolean success = faceEmbeddingService.storeEmbedding(request.getUserId(), request.getEmbedding());

        if (success) {
            return ResponseEntity.ok("✅ Embedding stored successfully.");
        } else {
            return ResponseEntity.badRequest().body("❌ Failed to store embedding.");
        }
    }
}
