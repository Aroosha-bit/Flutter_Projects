import 'package:flutter/material.dart';

class HostelFinePaymentScreen extends StatefulWidget {
  const HostelFinePaymentScreen({super.key});

  @override
  State<HostelFinePaymentScreen> createState() => _HostelFinePaymentScreenState();
}

class _HostelFinePaymentScreenState extends State<HostelFinePaymentScreen> {
  String? selectedAccount;
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController fineIdController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  final List<String> accounts = [
    'Easypaisa',
    'JazzCash',
  ];

  @override
  void dispose() {
    accountNumberController.dispose();
    fineIdController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hostel Fine Payment'),
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
              'Select Account',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: selectedAccount,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              hint: const Text('Select Account'),
              items: accounts.map((String account) {
                return DropdownMenuItem<String>(
                  value: account,
                  child: Text(account),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedAccount = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Enter Account No',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: accountNumberController,
              keyboardType: TextInputType.number,
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
              'Enter Fine ID',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: fineIdController,
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
              'Enter Amount',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: selectedAccount == null ||
                  accountNumberController.text.isEmpty ||
                  fineIdController.text.isEmpty ||
                  amountController.text.isEmpty
                  ? null
                  : () {
                // Simulate payment (to be connected with backend)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Hostel Fine payment successful'),
                  ),
                );
                Navigator.popUntil(context, ModalRoute.withName('/student/dashboard'));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Pay',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}