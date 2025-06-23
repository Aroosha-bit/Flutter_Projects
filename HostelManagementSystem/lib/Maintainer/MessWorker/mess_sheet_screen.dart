import 'package:flutter/material.dart';

class MaintainerMessSheetScreen extends StatelessWidget {
  MaintainerMessSheetScreen({super.key});

  // Sample data for 30 days (to be replaced with Firestore data)
  final List<Map<String, dynamic>> messSheetData = List.generate(
    5,
        (index) => {
      'messId': '01-01-25',
      'days': List.generate(30, (day) => (day + index) % 2), // Alternating 1 and 0 for demo
    },
  );

  // Sample menu data (to be fetched from Firestore)
  final Map<String, dynamic> menuData = {
    'breakfast': {'item': 'Paratha & Chai', 'price': 50},
    'dinner': {'item': 'Biryani', 'price': 100},
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mess Sheet'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    const DataColumn(label: Text('Mess ID')),
                    ...List.generate(
                      30,
                          (index) => DataColumn(label: Text('D${index + 1}')),
                    ),
                  ],
                  rows: messSheetData.map((data) {
                    return DataRow(
                      cells: [
                        DataCell(Text(data['messId'])),
                        ...data['days'].map<DataCell>((day) {
                          return DataCell(Text(day.toString()));
                        }).toList(),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Menu Items & Costs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Breakfast: ${menuData['breakfast']['item']} (${menuData['breakfast']['price']} units)'),
                  const SizedBox(height: 5),
                  Text('Dinner: ${menuData['dinner']['item']} (${menuData['dinner']['price']} units)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}