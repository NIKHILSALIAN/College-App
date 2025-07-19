package com.example.college.app.dto;

import lombok.Data;

@Data
public class AttendanceMarkDto {
    private String studentId;
    private boolean present;
    private String markedBy;
}
