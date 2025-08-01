package com.example.college.app.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class OtpService {

    @Value("${twilio.phone.number}")
    private String twilioPhoneNumber;

    // 🧠 Store OTPs in memory using Map (Key: phone/email, Value: OTP)
    private final Map<String, String> otpStorage = new ConcurrentHashMap<>();

    // ✅ Send OTP and store it
    public String sendOtp(String toPhoneNumber, String otp) {
        // Step 1: Send SMS via Twilio
        Message message = Message.creator(
                new PhoneNumber(toPhoneNumber),
                new PhoneNumber(twilioPhoneNumber),
                "📲 Your OTP is: " + otp
        ).create();

        // Step 2: Store the OTP in memory
        otpStorage.put(toPhoneNumber, otp);

        return message.getSid();  // Optional: useful for debugging
    }

    // ✅ Verify if user-sent OTP matches stored OTP
    public boolean verifyOtp(String phoneOrEmail, String otp) {
        String storedOtp = otpStorage.get(phoneOrEmail);
        return storedOtp != null && storedOtp.equals(otp);
    }
}
