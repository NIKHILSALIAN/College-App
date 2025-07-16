package com.example.college.app.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.college.app.entity.Student;

import java.util.Optional;

public interface StudentRepository extends JpaRepository<Student, Long> {
    Optional<Student> findByEmail(String email);
    Optional<Student> findByContactNumber(String contactNumber);
    Optional<Student> findByStudentId(String studentId);
}
