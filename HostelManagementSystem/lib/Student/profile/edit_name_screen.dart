import 'package:flutter/material.dart';

class EditNameScreen extends StatelessWidget {
  const EditNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentName = ModalRoute.of(context)!.settings.arguments as String;
    final TextEditingController _nameController = TextEditingController(text: currentName);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Name'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: TextEditingController(text: currentName),
              enabled: false,
              decoration: InputDecoration(
                labelText: 'PREVIOUS NAME',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'xxxxxxxx',
                labelText: 'NEW NAME',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle name update logic (to be connected with backend)
                Navigator.pop(context, _nameController.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}