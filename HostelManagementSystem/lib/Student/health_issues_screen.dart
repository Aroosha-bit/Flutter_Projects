import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class HealthIssuesScreen extends StatefulWidget {
  const HealthIssuesScreen({super.key});

  @override
  State<HealthIssuesScreen> createState() => _HealthIssuesScreenState();
}

class _HealthIssuesScreenState extends State<HealthIssuesScreen> {
  String? selectedCategory;
  final TextEditingController descriptionController = TextEditingController();
  bool requestAmbulance = false;

  final List<String> categories = [
    'Fever',
    'Injury',
    'Allergy',
    'Stomach Issue',
    'Other',
  ];

  // Emergency number (e.g., 1122 in Pakistan)
  final String emergencyNumber = '1122';

  /*
  Future<void> _makeEmergencyCall() async {
    final Uri url = Uri(scheme: 'tel', path: emergencyNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not launch emergency call')),
      );
    }
  }*/

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Health Issues'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              hint: const Text('Select Category'),
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: requestAmbulance,
                  onChanged: (value) {
                    setState(() {
                      requestAmbulance = value!;
                    });
                  },
                ),
                const Text('Request for ambulance', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
//              onTap: _makeEmergencyCall,
              child: const Text(
                'Call Emergency',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: selectedCategory == null || descriptionController.text.isEmpty
                  ? null
                  : () {
                // Simulate submission (to be connected with backend)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Health issue submitted')),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}