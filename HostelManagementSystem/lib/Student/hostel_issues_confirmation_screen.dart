import 'package:flutter/material.dart';

class HostelIssuesConfirmationScreen extends StatelessWidget {
  const HostelIssuesConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Extract arguments passed from HostelIssuesScreen
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hostel Issues'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.grey,
                      size: 50,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Thank you',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Your request has been submitted.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Is your issue resolved?',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Simulate feedback (to be connected with backend)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Feedback recorded: Issue not resolved')),
                      );
                      Navigator.popUntil(context, ModalRoute.withName('/student/dashboard'));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Simulate feedback (to be connected with backend)
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Feedback recorded: Issue resolved')),
                      );
                      Navigator.popUntil(context, ModalRoute.withName('/student/dashboard'));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      'Yes',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}