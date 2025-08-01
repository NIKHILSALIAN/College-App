import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class StudentAttendanceCalendarPage extends StatefulWidget {
  const StudentAttendanceCalendarPage({super.key});

  @override
  State<StudentAttendanceCalendarPage> createState() => _StudentAttendanceCalendarPageState();
}

class _StudentAttendanceCalendarPageState extends State<StudentAttendanceCalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Sample dummy data
  final Set<DateTime> _presentDays = {
    DateTime.utc(2025, 8, 1),
    DateTime.utc(2025, 8, 2),
    DateTime.utc(2025, 8, 5),
    DateTime.utc(2025, 8, 6),
    DateTime.utc(2025, 8, 9),
  };

  final Set<DateTime> _absentDays = {
    DateTime.utc(2025, 8, 3),
    DateTime.utc(2025, 8, 4),
    DateTime.utc(2025, 8, 7),
  };

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  bool _isSunday(DateTime day) {
    return day.weekday == DateTime.sunday;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance Calendar'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => _isSameDay(_selectedDay ?? _focusedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  final isPresent = _presentDays.any((d) => _isSameDay(d, day));
                  final isAbsent = _absentDays.any((d) => _isSameDay(d, day));
                  final isSunday = _isSunday(day);

                  Color? bgColor;
                  if (isPresent) {
                    bgColor = Colors.green;
                  } else if (isAbsent) {
                    bgColor = Colors.redAccent;
                  } else if (isSunday) {
                    bgColor = Colors.red.shade300;
                  }

                  return Container(
                    margin: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: bgColor ?? Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: isSunday || isAbsent ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              ),
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
              ),
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 20),

            // Optional: Show attendance status for selected day
            if (_selectedDay != null)
              Text(
                _buildStatusText(_selectedDay!),
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
          ],
        ),
      ),
    );
  }

  String _buildStatusText(DateTime day) {
    if (_isSunday(day)) return "Holiday (Sunday)";
    if (_presentDays.any((d) => _isSameDay(d, day))) return "Present";
    if (_absentDays.any((d) => _isSameDay(d, day))) return "Absent";
    return "No record";
  }
}
