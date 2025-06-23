import 'package:flutter/material.dart';

class MessWorkerDashboardScreen extends StatelessWidget {
  const MessWorkerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with logo and search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'UETT Hostel',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/maintainer/notifications');
                    },
                  ),
                ],
              ),
            ),
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
                  fillColor: Colors.grey[200],
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
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ServiceCard(
                    title: 'Menu',
                    onTap: () {
                      Navigator.pushNamed(context, '/maintainer/mess_worker/menu');
                    },
                  ),
                  const SizedBox(height: 20),
                  ServiceCard(
                    title: 'Mess Sheet',
                    onTap: () {
                      Navigator.pushNamed(context, '/maintainer/mess_worker/mess_sheet');
                    },
                  ),
                  const SizedBox(height: 20),
                  ServiceCard(
                    title: 'Mess Bill',
                    onTap: () {
                      Navigator.pushNamed(context, '/maintainer/mess_worker/mess_bill');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
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
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/maintainer/notifications');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/maintainer/settings');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/maintainer/profile');
          }
        },
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}