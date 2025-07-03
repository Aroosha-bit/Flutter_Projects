import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../services/storage_service.dart';
import 'edit_profile_screen.dart';
import '../theme_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile? _profile;
  final StorageService _storageService = StorageService();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final profile = await _storageService.getProfile();
    if (profile != null) {
      print('Loaded profile: ${profile.toMap()}');
      if (profile.profileImageBase64 != null && profile.profileImageBase64!.isNotEmpty) {
        print('Image base64 length: ${profile.profileImageBase64!.length}');
      } else {
        print('No image base64 in profile');
      }
    } else {
      print('No profile data loaded');
    }
    setState(() {
      _profile = profile;
    });
  }

  void _navigateToEditScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    ).then((_) => _loadProfile());
  }

  void _toggleTheme() {
    ThemeManager.themeMode.value = ThemeManager.themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
        child: _profile == null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No profile data available',
                style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? Colors.blueGrey[700]
                    : Colors.blue[200],
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: const Size(200, 0),
              ),
              onPressed: _navigateToEditScreen,
              child: Text(
                'Edit Profile',
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
        )
            : SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Hero(
                tag: 'profileImageHero',
                child: _profile!.profileImageBase64 != null &&
                    _profile!.profileImageBase64!.isNotEmpty
                    ? CircleAvatar(
                  radius: 50,
                  backgroundImage: MemoryImage(
                    base64Decode(_profile!.profileImageBase64!),
                  ),
                )
                    : CircleAvatar(
                  radius: 50,
                  backgroundImage:
                  const AssetImage('assets/person.png'),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  border: Border.all(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.grey[600]!
                        : Colors.blue[300]!,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildProfileField('Name', _profile!.fullName ?? 'N/A', context),
                     Divider(color: Colors.blue[300], thickness: 1.0),
                    _buildProfileField('Email', _profile!.email ?? 'N/A', context),
                     Divider(color: Colors.blue[300], thickness: 1.0),
                    _buildProfileField('Phone', _profile!.phoneNumber ?? 'N/A', context),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).brightness == Brightness.dark
                      ? Colors.blueGrey[700]
                      : Colors.blue[200],
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: const Size(200, 0),
                ),
                onPressed: _navigateToEditScreen,
                child: Text(
                  'Edit Profile',
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
    );
  }

  Widget _buildProfileField(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.blue[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white70
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}