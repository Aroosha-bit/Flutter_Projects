import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  // Sample data for notifications (to be replaced with backend data)
  final List<Map<String, String>> notifications = const [
    {
      'title': 'Mess Bill',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non ...'
    },
    {
      'title': 'Mess Bill',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non ...'
    },
    {
      'title': 'Mess Bill',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non ...'
    },
    {
      'title': 'Mess Bill',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non ...'
    },
    {
      'title': 'Mess Bill',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non ...'
    },
    {
      'title': 'Mess Bill',
      'description':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec tincidunt pretium egestas nec venen dignissim non ...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 15.0),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification['title']!,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Description  ${notification['description']}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}