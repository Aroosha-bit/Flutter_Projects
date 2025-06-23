import 'package:flutter/material.dart';

class DispensarTasksCompletedScreen extends StatelessWidget {
  const DispensarTasksCompletedScreen({super.key});

  // Sample data for completed tasks (to be replaced with Firestore data)
  final List<Map<String, String>> completedTasks = const [
    {
      'category': 'Medical Supply Request',
      'description':
      'Restocked first aid kits in Hall A. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Done...'
    },
    {
      'category': 'Inventory Check',
      'description':
      'Completed inventory audit for medical supplies. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Done...'
    },
    {
      'category': 'Medical Supply Request',
      'description':
      'Delivered bandages to Hall B. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Done...'
    },
    {
      'category': 'Inventory Check',
      'description':
      'Updated stock records for pharmacy. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Done...'
    },
    {
      'category': 'Medical Supply Request',
      'description':
      'Provided medicine to student in Hall C. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Done...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks Completed'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Card(
              color: Colors.green[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      completedTasks[index]['category']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      completedTasks[index]['description']!,
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}