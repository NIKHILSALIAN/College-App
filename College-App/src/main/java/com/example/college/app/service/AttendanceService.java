package com.example.college.app.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.college.app.dto.AttendanceMarkDto;
import com.example.college.app.entity.Attendance;
import com.example.college.app.repository.AttendanceRepository;

@Service
public class AttendanceService {

    @Autowired
    private AttendanceRepository attendanceRepository;

    public Attendance markAttendance(AttendanceMarkDto dto) {
        Attendance attendance = new Attendance();
        attendance.setStudentId(dto.getStudentId());
        attendance.setDate(LocalDate.now());
        attendance.setPresent(dto.isPresent());
        attendance.setMarkedBy(dto.getMarkedBy());
        return attendanceRepository.save(attendance);
    }

    public List<Attendance> getAttendanceByStudentId(String studentId) {
        return attendanceRepository.findByStudentId(studentId);
    }

    public List<Attendance> getAttendanceByDate(LocalDate date) {
        return attendanceRepository.findByDate(date);
    }
}
