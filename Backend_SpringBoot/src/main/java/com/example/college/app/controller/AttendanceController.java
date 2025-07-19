package com.example.college.app.controller;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.college.app.dto.AttendanceMarkDto;
import com.example.college.app.entity.Attendance;
import com.example.college.app.service.AttendanceService;

@RestController
@RequestMapping("/api/attendance")
@CrossOrigin("*")
public class AttendanceController {

    @Autowired
    private AttendanceService attendanceService;

    @PostMapping("/mark")
    public Attendance markAttendance(@RequestBody AttendanceMarkDto dto) {
        return attendanceService.markAttendance(dto);
            }

    @GetMapping("/{studentId}")
    public List<Attendance> getByStudentId(@PathVariable String studentId) {
        return attendanceService.getAttendanceByStudentId(studentId);
    }

    @GetMapping("/date/{date}")
    public List<Attendance> getByDate(@PathVariable String date) {
        return attendanceService.getAttendanceByDate(LocalDate.parse(date));
    }
}
