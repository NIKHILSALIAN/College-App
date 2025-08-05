package com.example.college.app.entity;

import java.time.LocalDate;
import java.util.List;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "students")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    private String studentId;

    private String name;
    private String address;
    private String contactNumber;

    @Column(unique = true)
    private String email;

    private String password;

    private int age;
    private LocalDate dob;
    private String gender;
    private String stream;

    @Column(name = "class_name")
    private String studentClass;

    @ElementCollection
    @CollectionTable(
        name = "student_embeddings",
        joinColumns = @JoinColumn(name = "student_id")
    )
    @Column(name = "embedding_value")
    private List<Double> faceEmbedding;
}
