import 'package:flutter/material.dart';

class RoomAllocationFormScreen extends StatefulWidget {
  const RoomAllocationFormScreen({super.key});

  @override
  State<RoomAllocationFormScreen> createState() => _RoomAllocationFormScreenState();
}

class _RoomAllocationFormScreenState extends State<RoomAllocationFormScreen> {
  late int capacity;
  List<TextEditingController> nameControllers = [];
  List<TextEditingController> regNoControllers = [];
  List<TextEditingController> emailControllers = [];
  List<TextEditingController> cgpaControllers = [];

  @override
  void initState() {
    super.initState();
    // Extract arguments passed from RoomSelectionScreen
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    capacity = int.parse(args['capacity']!);
    initializeControllers(capacity);
  }

  void initializeControllers(int capacity) {
    nameControllers = List.generate(capacity, (_) => TextEditingController());
    regNoControllers = List.generate(capacity, (_) => TextEditingController());
    emailControllers = List.generate(capacity, (_) => TextEditingController());
    cgpaControllers = List.generate(capacity, (_) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in nameControllers) {
      controller.dispose();
    }
    for (var controller in regNoControllers) {
      controller.dispose();
    }
    for (var controller in emailControllers) {
      controller.dispose();
    }
    for (var controller in cgpaControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Room Allocation Form'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < capacity; i++) ...[
                Text(
                  'Student ${i + 1} Details',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: nameControllers[i],
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'User',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: regNoControllers[i],
                  decoration: InputDecoration(
                    labelText: 'Reg No',
                    hintText: '21-SE-XX',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: emailControllers[i],
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'user@gmail.com',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: cgpaControllers[i],
                  decoration: InputDecoration(
                    labelText: 'CGPA',
                    hintText: '4.00',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
              ],
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle form submission (to be connected with backend)
                  List<Map<String, String>> studentDetails = [];
                  for (int i = 0; i < capacity; i++) {
                    studentDetails.add({
                      'name': nameControllers[i].text,
                      'regNo': regNoControllers[i].text,
                      'email': emailControllers[i].text,
                      'cgpa': cgpaControllers[i].text,
                    });
                  }
                  // Simulate submission
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Room allocation submitted')),
                  );
                  Navigator.popUntil(context, ModalRoute.withName('/student/dashboard'));
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
      ),
    );
  }
}