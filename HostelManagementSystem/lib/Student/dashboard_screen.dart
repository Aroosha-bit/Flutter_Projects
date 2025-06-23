import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Header with logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/uet_hostel_logo.png',
                    height: MediaQuery.of(context).size.height * 0.05, // Responsive height
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      // Navigate to Notifications screen
                      Navigator.pushNamed(context, '/notifications');
                    },
                  ),
                ],
              ),
            ),
            // Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  suffixIcon: const Icon(Icons.mic, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            // Available Services
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Available Services',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.2,
                  children: [
                    ServiceCard(
                      title: 'ROOM ALLOCATION',
                      image: 'assets/images/room_allocation.jpg',
                      onTap: () {
                        // Navigate to Room Selection screen
                        Navigator.pushNamed(context, '/student/room_selection');
                      },
                    ),
                    ServiceCard(
                      title: 'FOOD',
                      image: 'assets/images/Food.jpg',
                      onTap: () {
                        // Navigate to Food screen
                        Navigator.pushNamed(context, '/student/food');
                      },
                    ),
                    ServiceCard(
                      title: 'HOSTEL ISSUES',
                      image: 'assets/images/hostel_issues.png',
                      onTap: () {
                        // Navigate to Hostel Issues screen
                        Navigator.pushNamed(context, '/student/hostel_issues');
                      },
                    ),
                    ServiceCard(
                      title: 'HEALTH ISSUES',
                      image: 'assets/images/health_issues.png',
                      onTap: () {
                        // Navigate to Health Issues screen
                        Navigator.pushNamed(context, '/student/health_issues');
                      },
                    ),
                    ServiceCard(
                      title: 'PAYMENTS',
                      image: 'assets/images/Payments.png',
                      onTap: () {
                        // Navigate to Payment Selection screen
                        Navigator.pushNamed(context, '/student/payment_selection');
                      },
                    ),
                    ServiceCard(
                      title: 'OUTINGS/LEAVE',
                      image: 'assets/images/outings_leave.jpg',
                      onTap: () {
                        // Navigate to Outings/Leave screen
                        Navigator.pushNamed(context, '/student/outings_leave');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Home is selected by default
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.checklist),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            // Navigate to Task screen
            Navigator.pushNamed(context, '/task');
          } else if (index == 2) {
            // Navigate to Settings screen
            Navigator.pushNamed(context, '/student/settings');
          } else if (index == 3) {
            // Navigate to Profile screen
            Navigator.pushNamed(context, '/student/profile');
          }
          // Handle other navigation items as needed
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: MediaQuery.of(context).size.height * 0.1, // Responsive height
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}