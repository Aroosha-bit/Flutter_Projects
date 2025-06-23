import 'package:flutter/material.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key});

  @override
  State<SignUpScreen2> createState() => _SignUpScreen2State();
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  String _selectedGender = 'Male';
  String _selectedCourse = 'BS';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'UPLOAD YOUR IMAGE',
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle image upload logic (to be connected with backend)
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey[200],
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'GENDER',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChoiceChip(
                    label: const Text('Male'),
                    selected: _selectedGender == 'Male',
                    onSelected: (selected) {
                      setState(() {
                        _selectedGender = 'Male';
                      });
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: _selectedGender == 'Male' ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text('Female'),
                    selected: _selectedGender == 'Female',
                    onSelected: (selected) {
                      setState(() {
                        _selectedGender = 'Female';
                      });
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: _selectedGender == 'Female' ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'COURSE',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ChoiceChip(
                    label: const Text('BS'),
                    selected: _selectedCourse == 'BS',
                    onSelected: (selected) {
                      setState(() {
                        _selectedCourse = 'BS';
                      });
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: _selectedCourse == 'BS' ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text('MS'),
                    selected: _selectedCourse == 'MS',
                    onSelected: (selected) {
                      setState(() {
                        _selectedCourse = 'MS';
                      });
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: _selectedCourse == 'MS' ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ChoiceChip(
                    label: const Text('PHD'),
                    selected: _selectedCourse == 'PHD',
                    onSelected: (selected) {
                      setState(() {
                        _selectedCourse = 'PHD';
                      });
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: _selectedCourse == 'PHD' ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  // Handle Sign Up logic (to be connected with backend)
                  Navigator.pushReplacementNamed(context, '/student/dashboard');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/student/sign_in');
                  },
                  child: const Text(
                    'Already have account? Sign In',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}