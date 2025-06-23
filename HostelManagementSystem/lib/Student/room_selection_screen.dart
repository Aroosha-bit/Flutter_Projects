import 'package:flutter/material.dart';

class RoomSelectionScreen extends StatefulWidget {
  const RoomSelectionScreen({super.key});

  @override
  State<RoomSelectionScreen> createState() => _RoomSelectionScreenState();
}

class _RoomSelectionScreenState extends State<RoomSelectionScreen> {
  // Simulated user data (to be fetched from backend or passed from signup)
  String userGender = 'Female'; // Example: 'Male' or 'Female'
  String userCourse = 'BS'; // Example: 'BS' or other
  String? selectedYear;
  String? selectedHall;
  String? selectedCapacity;

  // Dropdown options based on conditions
  List<String> getYearOptions() {
    if (userCourse == 'BS') {
      return ['Year 1', 'Year 2', 'Year 3', 'Year 4'];
    }
    return ['Year 1', 'Year 2'];
  }

  List<String> getHallOptions() {
    if (userGender == 'Female') {
      if (userCourse == 'BS') {
        if (selectedYear == 'Year 4') {
          return ['Fatima Hall'];
        }
        return ['Ayesha Hall'];
      }
      return ['Fatima Hall'];
    } else {
      // Male
      if (userCourse == 'BS') {
        if (selectedYear == 'Year 4') {
          return ['I Hall', 'AB Hall'];
        } else if (selectedYear == 'Year 3') {
          return ['Q Hall'];
        } else if (selectedYear == 'Year 2') {
          return ['JBH Hall'];
        } else if (selectedYear == 'Year 1') {
          return ['AB Hall'];
        }
      }
    }
    return [];
  }

  List<String> getCapacityOptions() {
    if (selectedYear == 'Year 4' || userCourse != 'BS') {
      return ['2'];
    }
    return ['4'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Room Allocation'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select Year',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedYear,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              hint: const Text('Select Year'),
              items: getYearOptions().map((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedYear = newValue;
                  selectedHall = null; // Reset hall selection
                  selectedCapacity = null; // Reset capacity selection
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Hall',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedHall,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              hint: const Text('Select Hall'),
              items: getHallOptions().map((String hall) {
                return DropdownMenuItem<String>(
                  value: hall,
                  child: Text(hall),
                );
              }).toList(),
              onChanged: selectedYear == null
                  ? null
                  : (String? newValue) {
                setState(() {
                  selectedHall = newValue;
                  selectedCapacity = null; // Reset capacity selection
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Room Capacity',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedCapacity,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              hint: const Text('Select Capacity'),
              items: getCapacityOptions().map((String capacity) {
                return DropdownMenuItem<String>(
                  value: capacity,
                  child: Text(capacity),
                );
              }).toList(),
              onChanged: selectedHall == null
                  ? null
                  : (String? newValue) {
                setState(() {
                  selectedCapacity = newValue;
                });
              },
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: selectedCapacity == null
                  ? null
                  : () {
                Navigator.pushNamed(
                  context,
                  '/student/room_allocation_form',
                  arguments: {
                    'year': selectedYear,
                    'hall': selectedHall,
                    'capacity': selectedCapacity,
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}