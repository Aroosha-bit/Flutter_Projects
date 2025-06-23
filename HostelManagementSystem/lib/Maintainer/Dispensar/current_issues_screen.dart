import 'package:flutter/material.dart';

class DispensarCurrentIssuesScreen extends StatelessWidget {
  const DispensarCurrentIssuesScreen({super.key});

  // Sample data for current issues (to be replaced with Firestore data)
  final List<Map<String, String>> currentIssues = const [
    {
      'category': 'Medical Supply Shortage',
      'description':
      'Low stock of bandages in Hall A. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pending...'
    },
    {
      'category': 'Student Health Issue',
      'description':
      'Student in Hall B reported fever. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pending...'
    },
    {
      'category': 'Medical Supply Shortage',
      'description':
      'Out of painkillers in pharmacy. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pending...'
    },
    {
      'category': 'Student Health Issue',
      'description':
      'Student in Hall C needs medical checkup. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pending...'
    },
    {
      'category': 'Inventory Request',
      'description':
      'Need to order more antiseptic. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pending...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Issues'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        itemCount: currentIssues.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Card(
              color: Colors.pink[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentIssues[index]['category']!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      currentIssues[index]['description']!,
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