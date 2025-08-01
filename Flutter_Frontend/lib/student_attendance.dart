import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';


class StudentAttendancePage extends StatefulWidget {
  const StudentAttendancePage({super.key});

  @override
  State<StudentAttendancePage> createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final double overallAttendancePercent = 87.4;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Dummy data placeholders (replace with real backend values)
  Widget _buildAttendanceList(String category) {
    List<Map<String, dynamic>> dummyData = [
      {
        'title': 'Math',
        'present': 20,
        'total': 24,
        'teacher': 'Tort',
      },
      {
        'title': 'Science',
        'present': 18,
        'total': 22,
        'teacher': 'Rabbit',
      },
    ];

    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) {
        final item = dummyData[index];
        double percent = (item['present'] / item['total']) * 100;

        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            title: Text('${item['title']} (${percent.toStringAsFixed(1)}%)'),
            subtitle: Text('Present: ${item['present']}/${item['total']} | Teacher: ${item['teacher']}'),
            trailing: Icon(
              percent >= 75 ? Icons.check_circle_outline : Icons.warning_amber_outlined,
              color: percent >= 75 ? Colors.green : Colors.red,
            ),
          ),
        );
      },
    );
  }

  // -------------------- Main Build ----------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Attendance'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Monthly'),
            Tab(text: 'Weekly'),
            Tab(text: 'Subject'),
            Tab(text: 'Teacher'),
          ],
        ),
      ),
      body: Column(
        children: [
          // ---------------- Pie Chart for Overall % ----------------
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            child: PieChart(
              PieChartData(
                centerSpaceRadius: 50,
                sections: [
                  PieChartSectionData(
                    title: '${overallAttendancePercent.toStringAsFixed(1)}%',
                    value: overallAttendancePercent,
                    color: Colors.green,
                    radius: 70,
                    titleStyle: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  PieChartSectionData(
                    title: '',
                    value: 100 - overallAttendancePercent,
                    color: Colors.grey.shade300,
                    radius: 70,
                  ),
                ],
              ),
            ),
          ),

          // ---------------- Progress Bar ----------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Overall Attendance',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: overallAttendancePercent / 100,
                  backgroundColor: Colors.grey.shade300,
                  color: overallAttendancePercent >= 75 ? Colors.green : Colors.red,
                  minHeight: 10,
                ),
                const SizedBox(height: 6),
                Text('${overallAttendancePercent.toStringAsFixed(1)}% Present'),
              ],
            ),
          ),

          // ---------------- Tab View ----------------
          Expanded(
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  indicatorColor: Colors.deepPurple,
                  tabs: const [
                    Tab(text: 'Monthly'),
                    Tab(text: 'Weekly'),
                    Tab(text: 'Subject-wise'),
                    Tab(text: 'Teacher-wise'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _buildAttendanceList('Monthly'),
                      _buildAttendanceList('Teacher-wise'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
