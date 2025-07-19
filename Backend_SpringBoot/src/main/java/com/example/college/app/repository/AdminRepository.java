package com.example.college.app.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.college.app.entity.Admin;

public interface AdminRepository extends JpaRepository<Admin, Long>{

    Optional<Admin> findByUsername(String username);


}
