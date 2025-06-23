import 'package:flutter/material.dart';

class MaintainerSettingsScreen extends StatelessWidget {
  const MaintainerSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: const Text(
                'Change Password',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/maintainer/settings/change_password');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Feedback',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/maintainer/settings/feedback');
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Terms & Conditions',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                Navigator.pushNamed(context, '/maintainer/settings/terms_conditions');
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}