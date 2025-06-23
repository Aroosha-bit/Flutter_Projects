import 'package:flutter/material.dart';

class MaintainerFeedbackScreen extends StatefulWidget {
  const MaintainerFeedbackScreen({super.key});

  @override
  State<MaintainerFeedbackScreen> createState() => _MaintainerFeedbackScreenState();
}

class _MaintainerFeedbackScreenState extends State<MaintainerFeedbackScreen> {
  final TextEditingController feedbackController = TextEditingController();

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Feedback',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your feedback',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: feedbackController.text.isEmpty
                  ? null
                  : () {
                // Simulate feedback submission (to be connected with backend)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Feedback submitted successfully')),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Submit Feedback',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}