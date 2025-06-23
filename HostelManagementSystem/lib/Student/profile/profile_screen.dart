import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _nickname = 'Aroosha Fatima';
  String _email = 'xyz@gmail.com';
  String _gender = 'Female';
  String _address = '';
  String? _profileImage; // Placeholder for profile image path (null if not set)

  void _updateProfile(String field, String newValue) {
    setState(() {
      if (field == 'nickname') {
        _nickname = newValue;
      } else if (field == 'email') {
        _email = newValue;
      } else if (field == 'address') {
        _address = newValue;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Edit Profile Image',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
                GestureDetector(
                  onTap: () {
                    _showImageOptions(context);
                  },
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: _profileImage != null ? NetworkImage(_profileImage!) : null,
                    child: _profileImage == null
                        ? const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 40,
                    )
                        : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ListTile(
              title: const Text('Nickname'),
              subtitle: Text(_nickname),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/student/profile/edit_name',
                  arguments: _nickname,
                );
                if (result != null) {
                  _updateProfile('nickname', result as String);
                }
              },
            ),
            ListTile(
              title: const Text('Email'),
              subtitle: Text(_email),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/student/profile/edit_email',
                  arguments: _email,
                );
                if (result != null) {
                  _updateProfile('email', result as String);
                }
              },
            ),
            ListTile(
              title: const Text('Gender'),
              subtitle: Text(_gender),
              trailing: DropdownButton<String>(
                value: _gender,
                items: ['Male', 'Female'].map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _gender = newValue!;
                    // Handle gender update (to be connected with backend)
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Address'),
              subtitle: Text(_address.isEmpty ? 'Not set' : _address),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () async {
                final result = await Navigator.pushNamed(
                  context,
                  '/student/profile/edit_address',
                  arguments: _address,
                );
                if (result != null) {
                  _updateProfile('address', result as String);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showImageOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                title: const Text('View Photo'),
                onTap: () {
                  Navigator.pop(context);
                  if (_profileImage != null) {
                    // Handle view photo logic (to be connected with backend)
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('View Photo'),
                        content: Image.network(_profileImage!),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('No photo to view')),
                    );
                  }
                },
              ),
              ListTile(
                title: const Text('Change Photo'),
                onTap: () {
                  Navigator.pop(context);
                  _showChangePhotoOptions(context);
                },
              ),
              ListTile(
                title: const Text('Delete Photo'),
                onTap: () {
                  Navigator.pop(context);
                  setState(() {
                    _profileImage = null;
                    // Handle delete photo logic (to be connected with backend)
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Photo deleted')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showChangePhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                title: const Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  // Simulate selecting from gallery (to be connected with backend)
                  setState(() {
                    _profileImage = 'https://via.placeholder.com/150'; // Placeholder image URL
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Photo selected from gallery')),
                  );
                },
              ),
              ListTile(
                title: const Text('Drive'),
                onTap: () {
                  Navigator.pop(context);
                  // Simulate selecting from drive (to be connected with backend)
                  setState(() {
                    _profileImage = 'https://via.placeholder.com/150'; // Placeholder image URL
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Photo selected from drive')),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}