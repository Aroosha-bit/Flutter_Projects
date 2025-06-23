import 'package:flutter/material.dart';

class LeavingPermissionScreen extends StatelessWidget {
  const LeavingPermissionScreen({super.key});

  // Sample data for leave requests (to be replaced with Firestore data)
  final List<Map<String, String>> leaveRequests = const [
    {
      'studentName': 'Student Name',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non...'
    },
    {
      'studentName': 'Student Name',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non...'
    },
    {
      'studentName': 'Student Name',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non...'
    },
    {
      'studentName': 'Student Name',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non...'
    },
    {
      'studentName': 'Student Name',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaving Permission'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        itemCount: leaveRequests.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Card(
              color: Colors.blue[50],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  leaveRequests[index]['studentName']!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  leaveRequests[index]['description']!,
                  style: const TextStyle(fontSize: 14, color: Colors.black54),
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/maintainer/residential_tutor/leaving_permission_form',
                    arguments: leaveRequests[index],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}