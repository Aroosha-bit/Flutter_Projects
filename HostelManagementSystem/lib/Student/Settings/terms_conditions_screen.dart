import 'package:flutter/material.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Terms & Conditions'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '1. INTRODUCTION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome to the Hostel Management System (HMS) by UETT. By using this application, you agree to comply with the following terms and conditions. Please read them carefully.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '2. USER REGISTRATION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Only registered hostel residents of UETT or affiliated hostels are allowed to use this system. Users must provide accurate information during registration. It is strictly prohibited to share login credentials.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '3. ACCOUNT & SECURITY',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'You are responsible for maintaining the security of your account credentials. In case of unauthorized access, notify the administration immediately. Any suspicious activity will lead to account suspension.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '4. PAYMENTS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'All payments (hostel fees, mess bills, etc.) must be made through the provided payment gateways. Refunds will only be processed as per hostel policies. Non-payment may lead to penalties.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '5. ATTENDANCE & MESS MANAGEMENT',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Students must mark their daily attendance for mess charges. Mess charges will be calculated based on attendance. Any discrepancies must be reported within 7 days.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '6. ROOM & FACILITY USAGE',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Rooms are assigned based on university regulations. Any damage to hostel property must be reported immediately. Residents are responsible for repair costs.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '7. PRIVACY & DATA PROTECTION',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Personal data collected through this system will be used strictly for hostel management purposes. We do not share it with third parties unless required by law.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '8. DISCIPLINARY ACTIONS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Violation of hostel rules (misuse of the system, false information, etc.) may lead to warnings, fines, or account suspension.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '9. AMENDMENTS',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'UETT reserves the right to update these terms periodically. Users will be notified of any major changes.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '10. CONTACT US',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'For any queries or technical support, contact the hostel administration or visit the warden’s office.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}