package com.example.college.app.dto;

import java.util.List;

public class EmbeddingRequest {

    private Long userId;              // Student ID from your DB
    private List<Double> embedding;   // List of 128 floats from DeepFace

    public EmbeddingRequest() {
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public List<Double> getEmbedding() {
        return embedding;
    }

    public void setEmbedding(List<Double> embedding) {
        this.embedding = embedding;
    }
}
