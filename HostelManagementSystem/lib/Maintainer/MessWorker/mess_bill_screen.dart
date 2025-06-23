import 'package:flutter/material.dart';

class MessBillScreen extends StatelessWidget {
   MessBillScreen({super.key});

  // Sample data for residents (to be replaced with Firestore data)
  final List<Map<String, dynamic>> residents = List.generate(
    5,
        (index) => {
      'regNo': '21-SE-${index + 10}',
      'messId': '01-01-25',
      'name': 'Student ${index + 1}',
      'hazriUnits': (index + 1) * 10, // Total meals attended
      'currentMonthBill': (index + 1) * 1500 + 450, // Meals cost + service charges
      'previousBill': index % 2 == 0 ? 0 : 2000, // Unpaid previous bill
      'billPaid': index % 2 == 0 ? 3000 : 0, // Amount paid last month
      'datePayment': '01-04-2025',
      'arrears': index % 2 == 0 ? -500 : 200, // Extra paid or 10% fine
      'totalBill': 0, // Calculated below
    },
  );

  void _downloadAndSendBill(BuildContext context, Map<String, dynamic> resident) {
    // Simulate downloading and sending the bill (to be connected with backend)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Bill for ${resident['name']} sent via notifications')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mess Bill'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Total Hazri Units
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Total Hazri Units',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Sr No')),
                    DataColumn(label: Text('Reg No')),
                    DataColumn(label: Text('Mess ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Total Hazri Units')),
                  ],
                  rows: residents.asMap().entries.map((entry) {
                    final index = entry.key;
                    final resident = entry.value;
                    return DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text(resident['regNo'])),
                        DataCell(Text(resident['messId'])),
                        DataCell(Text(resident['name'])),
                        DataCell(Text(resident['hazriUnits'].toString())),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            // Section 2: Current Month Bill
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Current Month Bill',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Sr No')),
                    DataColumn(label: Text('Reg No')),
                    DataColumn(label: Text('Mess ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Current Month Bill')),
                    DataColumn(label: Text('Service Charges')),
                  ],
                  rows: residents.asMap().entries.map((entry) {
                    final index = entry.key;
                    final resident = entry.value;
                    return DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text(resident['regNo'])),
                        DataCell(Text(resident['messId'])),
                        DataCell(Text(resident['name'])),
                        DataCell(Text((resident['currentMonthBill'] - 450).toString())),
                        const DataCell(Text('450')),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            // Section 3: Previous Bill, Arrears, and Total Bill
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                'Bill Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Sr No')),
                    DataColumn(label: Text('Reg No')),
                    DataColumn(label: Text('Mess ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('Previous Bill')),
                    DataColumn(label: Text('Bill Paid')),
                    DataColumn(label: Text('Date Payment')),
                    DataColumn(label: Text('Arrears')),
                    DataColumn(label: Text('Total Bill')),
                    DataColumn(label: Text('Action')),
                  ],
                  rows: residents.asMap().entries.map((entry) {
                    final index = entry.key;
                    final resident = entry.value;
                    // Calculate Total Bill
                    final totalBill = (resident['currentMonthBill'] as int) +
                        (resident['previousBill'] as int) +
                        (resident['arrears'] as int);
                    return DataRow(
                      cells: [
                        DataCell(Text((index + 1).toString())),
                        DataCell(Text(resident['regNo'])),
                        DataCell(Text(resident['messId'])),
                        DataCell(Text(resident['name'])),
                        DataCell(Text(resident['previousBill'].toString())),
                        DataCell(Text(resident['billPaid'].toString())),
                        DataCell(Text(resident['datePayment'])),
                        DataCell(Text(resident['arrears'].toString())),
                        DataCell(Text(totalBill.toString())),
                        DataCell(
                          ElevatedButton(
                            onPressed: () => _downloadAndSendBill(context, resident),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              'Send Bill',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}