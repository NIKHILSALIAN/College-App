package com.example.college.app.config;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import com.twilio.Twilio;

@Configuration
@Profile("!test") // ❌ Prevent this from loading in test profile
public class TwilioConfig {

    @Value("${twilio.account.sid}")
    private String accountSid;

    @Value("${twilio.auth.token}")
    private String authToken;

    @PostConstruct
    public void initTwilio() {
        Twilio.init(accountSid, authToken);
        System.out.println("✅ Twilio initialized with Account SID: " + accountSid);
    }
}
