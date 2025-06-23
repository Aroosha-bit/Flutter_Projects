import 'package:flutter/material.dart';

class MaintainerNotificationsScreen extends StatefulWidget {
  const MaintainerNotificationsScreen({super.key});

  @override
  State<MaintainerNotificationsScreen> createState() => _MaintainerNotificationsScreenState();
}

class _MaintainerNotificationsScreenState extends State<MaintainerNotificationsScreen> {
  final TextEditingController messageController = TextEditingController();
  String? selectedRecipient;

  final List<String> recipientOptions = [
    'All Students',
    'Hostel Residents',
    'Mess Workers',
    'Residential Tutors',
    'Complaint Officers',
  ];

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Notification'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recipient',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedRecipient,
              hint: const Text('Select recipient'),
              items: recipientOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedRecipient = newValue;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Message',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: messageController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter your notification message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: messageController.text.isEmpty || selectedRecipient == null
                  ? null
                  : () {
                // Simulate sending notification (to be connected with backend)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Notification sent to $selectedRecipient'),
                  ),
                );
                messageController.clear();
                setState(() {
                  selectedRecipient = null;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Send Notification',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}