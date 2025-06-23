import 'package:flutter/material.dart';

class PaymentSelectionScreen extends StatefulWidget {
  const PaymentSelectionScreen({super.key});

  @override
  State<PaymentSelectionScreen> createState() => _PaymentSelectionScreenState();
}

class _PaymentSelectionScreenState extends State<PaymentSelectionScreen> {
  String? selectedPaymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Payments'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio<String>(
                  value: 'Hostel Fine',
                  groupValue: selectedPaymentType,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentType = value;
                    });
                  },
                ),
                const Text('Hostel Fine', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Radio<String>(
                  value: 'Mess Bill',
                  groupValue: selectedPaymentType,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentType = value;
                    });
                  },
                ),
                const Text('Mess Bill', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: selectedPaymentType == null
                  ? null
                  : () {
                if (selectedPaymentType == 'Hostel Fine') {
                  Navigator.pushNamed(context, '/student/hostel_fine_payment');
                } else {
                  Navigator.pushNamed(context, '/student/mess_bill_payment');
                }
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