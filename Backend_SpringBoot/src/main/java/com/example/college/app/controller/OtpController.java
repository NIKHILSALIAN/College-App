package com.example.college.app.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired; // ✅ DTO with getEmailOrPhone()
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.college.app.dto.OtpRequest;
import com.example.college.app.service.OtpService;

@RestController
@RequestMapping("/api/otp")
public class OtpController {

    @Autowired
    private OtpService otpService;

    @PostMapping("/send")
    public ResponseEntity<String> sendOtp(@RequestParam String phone) {
        String otp = String.format("%04d", new Random().nextInt(10000));  // Generate 4-digit OTP
        otpService.sendOtp(phone, otp);
        return ResponseEntity.ok("OTP sent successfully ✅");
    }

    @PostMapping("/verify")
    public ResponseEntity<String> verifyOtp(@RequestBody OtpRequest request) {
        // 🔁 Use correct method name from DTO
        boolean isVerified = otpService.verifyOtp(request.getEmailOrPhone(), request.getOtp());
        if (isVerified) {
            return ResponseEntity.ok("OTP verified ✅ - Login successful!");
        } else {
            return ResponseEntity.status(401).body("❌ Invalid OTP");
        }
    }
}
