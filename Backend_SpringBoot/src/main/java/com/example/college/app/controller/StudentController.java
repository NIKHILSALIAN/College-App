package com.example.college.app.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.college.app.dto.StudentLoginDto;
import com.example.college.app.dto.StudentRegistrationDto;
import com.example.college.app.entity.Student;
import com.example.college.app.service.StudentService;

@RestController
@RequestMapping("api/students")
@CrossOrigin(origins = "*")  // ✅ For Flutter to connect
public class StudentController {

    @Autowired
    private StudentService studentService;

    // ✅ Registration API
    @PostMapping("/register")
    public ResponseEntity<Student> register(@RequestBody StudentRegistrationDto dto) {
        Student student = studentService.register(dto);
        return ResponseEntity.ok(student);
    }

    // ✅ Login API
    @PostMapping("/login")
    public ResponseEntity<Student> login(@RequestBody StudentLoginDto dto) {
        try {
            Student student = studentService.login(dto);
            return ResponseEntity.ok(student);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

    // ✅ Ping Test Endpoint for connectivity check
    @GetMapping("/ping")
    public String ping() {
        return "Backend is working!";
    }

    // ✅ Forgot Password with OTP (sample placeholder)
    @PostMapping("/forgot-password")
    public ResponseEntity<String> forgotPassword(@RequestBody Map<String, String> request) {
        String emailOrPhone = request.get("emailOrPhone");
        // Generate OTP, store temporarily or send SMS/email
        return ResponseEntity.ok("OTP sent to your registered contact.");
    }
}
