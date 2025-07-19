package com.example.college.app.dto;

import java.time.LocalDate;

import lombok.Data;



@Data
public class StudentRegistrationDto {

    private String studentId;
    private String name;
    private String address;
    private String contactNumber;
    private String email;
    private String password;
    private int age;
    private LocalDate dob;
    private String gender;
    private String stream;
    private String studentClass;

}
