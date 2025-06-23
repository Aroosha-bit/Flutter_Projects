import 'package:flutter/material.dart';

class MessSheetScreen extends StatelessWidget {
   MessSheetScreen({super.key});

  // Sample mess sheet data for 30 days (to be fetched from backend)
  final List<Map<String, String>> messSheet = List.generate(
    30,
        (index) => {
      'date': (index + 1).toString().padLeft(2, '0'),
      'breakfast': index % 2 == 0 ? 'Paratha & Tea' : 'Bread & Omelette',
      'dinner': index % 2 == 0 ? 'Chicken Karahi & Roti' : 'Biryani & Raita',
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Mess Sheet'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columns: const [
              DataColumn(label: Text('Date', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Breakfast', style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(label: Text('Dinner', style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: messSheet.map((entry) {
              return DataRow(cells: [
                DataCell(Text(entry['date']!)),
                DataCell(Text(entry['breakfast']!)),
                DataCell(Text(entry['dinner']!)),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}