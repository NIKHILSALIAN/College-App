// package: com.example.college.app.service

package com.example.college.app.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.college.app.dto.AdminLoginDto;
import com.example.college.app.entity.Admin;
import com.example.college.app.repository.AdminRepository;

@Service
public class AdminService {

    @Autowired
    private AdminRepository adminRepo;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public Admin login(AdminLoginDto dto) {
        Optional<Admin> adminOpt = adminRepo.findByUsername(dto.getUsername());
        if (adminOpt.isPresent()) {
            Admin admin = adminOpt.get();
            if (passwordEncoder.matches(dto.getPassword(), admin.getPassword())) {
                return admin;
            }
        }
        throw new RuntimeException("Invalid admin credentials.");
    }

    // Optional: Register a new admin (you can call this only once manually)
    public Admin register(Admin admin) {
        admin.setPassword(passwordEncoder.encode(admin.getPassword()));
        return adminRepo.save(admin);
    }
}
