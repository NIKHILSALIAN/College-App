package com.example.college.app.service;

import com.example.college.app.entity.Student;
import com.example.college.app.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaceEmbeddingService {

    @Autowired
    private StudentRepository studentRepository;

    public boolean storeEmbedding(Long userId, List<Double> embedding) {
        return studentRepository.findById(userId).map(student -> {
            student.setFaceEmbedding(embedding);  // Assuming your Student model has List<Double> faceEmbedding
            studentRepository.save(student);
            return true;
        }).orElse(false);
    }
}
