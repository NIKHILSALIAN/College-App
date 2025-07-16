package com.example.college.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Optional;
import com.example.college.app.dto.StudentLoginDto;
import com.example.college.app.dto.StudentRegistrationDto;
import com.example.college.app.entity.Student;
import com.example.college.app.repository.StudentRepository;

@Service
public class StudentService {

@Autowired
private StudentRepository studentRepository;

@Autowired
private PasswordEncoder passwordEncoder;

// registering  a student

    public Student register(StudentRegistrationDto dto) {
        Student student = new Student();

        student.setStudentId(dto.getStudentId());
        student.setName(dto.getName());
        student.setAddress(dto.getAddress());
        student.setContactNumber(dto.getContactNumber());
        student.setEmail(dto.getEmail());

        // Encrypt the password before saving
        student.setPassword(passwordEncoder.encode(dto.getPassword()));

        student.setAge(dto.getAge());
        student.setDob(dto.getDob());
        student.setGender(dto.getGender());
        student.setStream(dto.getStream());
        student.setStudentClass(dto.getStudentClass());

        return studentRepository.save(student); // Save to DB
    }

    // LOGIN a student
    public Student login(StudentLoginDto dto) {
        Optional<Student> studentOpt = studentRepository.findByEmail(dto.getEmailOrContact());

        // If not found by email, check contact number
        if (!studentOpt.isPresent()) {
            studentOpt = studentRepository.findByContactNumber(dto.getEmailOrContact());
        }

        if (studentOpt.isPresent()) {
            Student student = studentOpt.get();

            // Match password using BCrypt
            if (passwordEncoder.matches(dto.getPassword(), student.getPassword())) {
                return student;
            }
        }

        throw new RuntimeException("Invalid login credentials.");
    }
}



