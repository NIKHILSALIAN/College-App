import 'package:flutter/material.dart';

class StudentMessagesPage extends StatelessWidget {
  const StudentMessagesPage({super.key});

  // Dummy data for messages
  final List<Map<String, dynamic>> messages = const [
    {
      'title': 'Unit Test',
      'body': 'Unit Test 1 will start from 12th Aug. Be prepared.',
      'timestamp': '1 Aug, 10:00 AM',
      'isRead': false,
    },
    {
      'title': 'Project Submission',
      'body': 'Final project submission deadline is 20th Aug.',
      'timestamp': '30 July, 4:45 PM',
      'isRead': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notices'),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final msg = messages[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            elevation: 2,
            child: ListTile(
              leading: Icon(
                Icons.campaign_outlined,
                color: msg['isRead'] ? Colors.grey : Colors.deepPurple,
              ),
              title: Text(
                msg['title'],
                style: TextStyle(
                  fontWeight: msg['isRead'] ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Text(msg['body']),
              trailing: Text(
                msg['timestamp'],
                style: const TextStyle(fontSize: 12),
              ),
              onTap: () {
                // Optional: mark as read or show full detail
              },
            ),
          );
        },
      ),
    );
  }
}
