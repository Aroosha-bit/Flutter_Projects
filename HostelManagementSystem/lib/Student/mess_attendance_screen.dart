import 'package:flutter/material.dart';

class MessAttendanceScreen extends StatefulWidget {
  const MessAttendanceScreen({super.key});

  @override
  State<MessAttendanceScreen> createState() => _MessAttendanceScreenState();
}

class _MessAttendanceScreenState extends State<MessAttendanceScreen> {
  bool breakfastAttended = false;
  bool dinnerAttended = false;

  // Sample items and prices (to be fetched from backend)
  final Map<String, List<Map<String, dynamic>>> mealItems = {
    'Breakfast': [
      {'item': 'Paratha', 'price': 50},
      {'item': 'Tea', 'price': 20},
    ],
    'Dinner': [
      {'item': 'Chicken Karahi', 'price': 150},
      {'item': 'Roti', 'price': 10},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mess Attendance'),
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
              'Mark Attendance',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _buildAttendanceOption(
              'Breakfast (UNIT)',
              breakfastAttended,
                  (value) => setState(() => breakfastAttended = value!),
              mealItems['Breakfast']!,
            ),
            const SizedBox(height: 20),
            _buildAttendanceOption(
              'Dinner (UNIT)',
              dinnerAttended,
                  (value) => setState(() => dinnerAttended = value!),
              mealItems['Dinner']!,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Simulate submission (to be connected with backend)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Attendance submitted')),
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

  Widget _buildAttendanceOption(
      String title,
      bool value,
      Function(bool?) onChanged,
      List<Map<String, dynamic>> items,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: value,
              onChanged: onChanged,
            ),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
        if (value) ...[
          const SizedBox(height: 10),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(item['item'], style: const TextStyle(fontSize: 14)),
                Text('Rs. ${item['price']}', style: const TextStyle(fontSize: 14)),
              ],
            ),
          )),
        ],
      ],
    );
  }
}