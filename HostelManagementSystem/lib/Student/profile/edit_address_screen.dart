import 'package:flutter/material.dart';

class EditAddressScreen extends StatelessWidget {
  const EditAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String currentAddress = ModalRoute.of(context)!.settings.arguments as String;
    final TextEditingController _addressController = TextEditingController(text: currentAddress);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Edit Address'),
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
              controller: TextEditingController(text: currentAddress.isEmpty ? 'Not set' : currentAddress),
              enabled: false,
              decoration: InputDecoration(
                labelText: 'PREVIOUS ADDRESS',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                hintText: 'xxxxxxxx',
                labelText: 'NEW ADDRESS',
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
                // Handle address update logic (to be connected with backend)
                Navigator.pop(context, _addressController.text);
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