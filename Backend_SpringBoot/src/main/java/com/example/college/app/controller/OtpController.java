package com.example.college.app.controller;

import com.example.college.app.service.OtpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Random;

// 📦 Add this class to handle sending + verifying OTP
@RestController
@RequestMapping("/api/otp")
public class OtpController {

    @Autowired
    private OtpService otpService;

    // ✅ Send OTP to user
    @PostMapping("/send")
    public ResponseEntity<String> sendOtp(@RequestParam String phone) {
        String otp = String.format("%04d", new Random().nextInt(10000));  // Generate 4-digit OTP
        otpService.sendOtp(phone, otp);
        return ResponseEntity.ok("OTP sent successfully ✅");
    }

    // ✅ Verify OTP from user
    @PostMapping("/verify")
    public ResponseEntity<String> verifyOtp(@RequestBody OtpRequest request) {
        boolean isVerified = otpService.verifyOtp(request.getEmailOrPhone(), request.getOtp());
        if (isVerified) {
            return ResponseEntity.ok("OTP verified ✅ - Login successful!");
        } else {
            return ResponseEntity.status(401).body("❌ Invalid OTP");
        }
    }
}
