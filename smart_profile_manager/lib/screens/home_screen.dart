import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../theme_manager.dart';
import '../models/profile.dart';
import '../services/storage_service.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _welcomeMessage = 'Welcome Back';
  final StorageService _storageService = StorageService();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await _storageService.getProfile();
    if (profile != null && profile.fullName != null && profile.fullName!.isNotEmpty) {
      setState(() {
        _welcomeMessage = 'Welcome Back, ${profile.fullName}';
      });
    }
  }

  void _toggleTheme() {
    ThemeManager.themeMode.value = ThemeManager.themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  Future<void> _resetProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clears all SharedPreferences data
    setState(() {
      _welcomeMessage = 'Welcome Back'; // Reset welcome message
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile data reset successfully')),
    );
  }

  void _navigateToProfileScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.white,
            ),
            onPressed: _toggleTheme,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            color: Theme.of(context).cardColor,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _welcomeMessage,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.blue[800],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.blueGrey[700]
                          : Colors.blue[200],
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: const Size(250, 0),
                    ),
                    onPressed: _navigateToProfileScreen,
                    child: Text(
                      'Go to Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).brightness == Brightness.dark
                          ? Colors.blueGrey[700]
                          : Colors.blue[200],
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      minimumSize: const Size(250, 0),
                    ),
                    onPressed: _resetProfile,
                    child: Text(
                      'Reset Profile',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}