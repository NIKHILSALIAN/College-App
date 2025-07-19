package com.example.college.app.dto;

import lombok.Data;


@Data
public class StudentLoginDto {
    private String emailOrContact;
    private String password;
}