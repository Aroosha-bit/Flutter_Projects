import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'image': 'assets/images/Onboarding1.png',
      'title': 'ALL IN ONE HOSTEL MANAGEMENT SYSTEM',
      'description': 'Discover our comprehensive educational software designed to simplify your academic journey.',
    },
    {
      'image': 'assets/images/Onboarding2.png',
      'title': 'FEES MODULE AND MESS MENU',
      'description': 'Pay fees seamlessly on our mobile app. Stay updated with daily mess menu offerings for a delightful dining experience.',
    },
    {
      'image': 'assets/images/Onboarding3.png',
      'title': 'BILLING AND PAYMENTS',
      'description': 'Manage your hostel bills and payments with ease and enjoy a hassle-free experience.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) => OnboardingPage(
                  image: onboardingData[index]['image']!,
                  title: onboardingData[index]['title']!,
                  description: onboardingData[index]['description']!,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                    (index) => buildDot(index, context),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login_selection');
                    },
                    child: const Text(
                      'SKIP ALL',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage == onboardingData.length - 1) {
                        Navigator.pushReplacementNamed(context, '/login_selection');
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    child: const Text(
                      'NEXT',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: _currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            height: MediaQuery.of(context).size.height * 0.4, // Responsive height
            width: double.infinity,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}