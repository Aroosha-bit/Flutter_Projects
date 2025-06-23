import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _breakfastItemController = TextEditingController();
  final TextEditingController _breakfastPriceController = TextEditingController();
  final TextEditingController _dinnerItemController = TextEditingController();
  final TextEditingController _dinnerPriceController = TextEditingController();

  @override
  void dispose() {
    _breakfastItemController.dispose();
    _breakfastPriceController.dispose();
    _dinnerItemController.dispose();
    _dinnerPriceController.dispose();
    super.dispose();
  }

  void _submitMenu() {
    // Simulate submitting the menu to Firestore (to be connected with backend)
    final breakfastItem = _breakfastItemController.text;
    final breakfastPrice = _breakfastPriceController.text;
    final dinnerItem = _dinnerItemController.text;
    final dinnerPrice = _dinnerPriceController.text;

    if (breakfastItem.isNotEmpty &&
        breakfastPrice.isNotEmpty &&
        dinnerItem.isNotEmpty &&
        dinnerPrice.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Menu Submitted Successfully')),
      );
      // Clear fields after submission
      _breakfastItemController.clear();
      _breakfastPriceController.clear();
      _dinnerItemController.clear();
      _dinnerPriceController.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
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
              'Breakfast',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _breakfastItemController,
              decoration: InputDecoration(
                hintText: 'Breakfast Item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _breakfastPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Price (Units)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Dinner',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dinnerItemController,
              decoration: InputDecoration(
                hintText: 'Dinner Item',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _dinnerPriceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Price (Units)',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _submitMenu,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}