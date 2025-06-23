import 'package:flutter/material.dart';

class OutingsLeaveScreen extends StatefulWidget {
  const OutingsLeaveScreen({super.key});

  @override
  State<OutingsLeaveScreen> createState() => _OutingsLeaveScreenState();
}

class _OutingsLeaveScreenState extends State<OutingsLeaveScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController regNoController = TextEditingController();
  final TextEditingController roomNoController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController placeController = TextEditingController();
  DateTime? arrivalDate;
  TimeOfDay? arrivalTime;
  DateTime? departureDate;
  TimeOfDay? departureTime;

  @override
  void dispose() {
    nameController.dispose();
    regNoController.dispose();
    roomNoController.dispose();
    contactController.dispose();
    placeController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isArrival) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2026),
    );
    if (picked != null) {
      setState(() {
        if (isArrival) {
          arrivalDate = picked;
        } else {
          departureDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isArrival) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isArrival) {
          arrivalTime = picked;
        } else {
          departureTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Outings/Leave'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
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
              'Enter reg no.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: regNoController,
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
              'Room No',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: roomNoController,
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
              'Contact Number',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: contactController,
              keyboardType: TextInputType.phone,
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
              'Place to Visit',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: placeController,
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
              'Date of Arrival',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context, true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: Text(
                  arrivalDate == null
                      ? 'Select Date'
                      : '${arrivalDate!.day}/${arrivalDate!.month}/${arrivalDate!.year}',
                  style: TextStyle(
                    color: arrivalDate == null ? Colors.grey : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Time of Arrival',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectTime(context, true),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: Text(
                  arrivalTime == null
                      ? 'Select Time'
                      : arrivalTime!.format(context),
                  style: TextStyle(
                    color: arrivalTime == null ? Colors.grey : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Date of Departure',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectDate(context, false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: Text(
                  departureDate == null
                      ? 'Select Date'
                      : '${departureDate!.day}/${departureDate!.month}/${departureDate!.year}',
                  style: TextStyle(
                    color: departureDate == null ? Colors.grey : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Time of Departure',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _selectTime(context, false),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
                child: Text(
                  departureTime == null
                      ? 'Select Time'
                      : departureTime!.format(context),
                  style: TextStyle(
                    color: departureTime == null ? Colors.grey : Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: nameController.text.isEmpty ||
                  regNoController.text.isEmpty ||
                  roomNoController.text.isEmpty ||
                  contactController.text.isEmpty ||
                  placeController.text.isEmpty ||
                  arrivalDate == null ||
                  arrivalTime == null ||
                  departureDate == null ||
                  departureTime == null
                  ? null
                  : () {
                // Simulate submission (to be connected with backend)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Leave request submitted')),
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