import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkTheme = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            ListTile(
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/student/settings/change_password');
              },
            ),
            ListTile(
              title: const Text('Theme'),
              trailing: Switch(
                value: _isDarkTheme,
                onChanged: (value) {
                  setState(() {
                    _isDarkTheme = value;
                    // Handle theme change (to be connected with backend or app-wide theme provider)
                  });
                },
                activeColor: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Language'),
              trailing: DropdownButton<String>(
                value: _selectedLanguage,
                items: ['English', 'Urdu'].map((String language) {
                  return DropdownMenuItem<String>(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedLanguage = newValue!;
                    // Handle language change (to be connected with backend or localization)
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Feedback'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/student/settings/feedback');
              },
            ),
            ListTile(
              title: const Text('Terms & Conditions'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/student/settings/terms_conditions');
              },
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle logout logic (to be connected with backend)
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login_selection',
                      (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 15),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Log Out',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}