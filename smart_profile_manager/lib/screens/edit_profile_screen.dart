import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';
import '../models/profile.dart';
import '../services/storage_service.dart';

class EditProfileScreen extends StatefulWidget {
  final Profile? profile;

  const EditProfileScreen({super.key, this.profile});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final StorageService _storageService = StorageService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Uint8List? _imageBytes;
  String? _imageBase64;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.profile?.fullName ?? '';
    _emailController.text = widget.profile?.email ?? '';
    _phoneController.text = widget.profile?.phoneNumber ?? '';
    _imageBase64 = widget.profile?.profileImageBase64;
    if (_imageBase64 != null && _imageBase64!.isNotEmpty) {
      _imageBytes = base64Decode(_imageBase64!);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _imageBytes = bytes;
          _imageBase64 = base64Encode(bytes);
          print('Image picked successfully: bytes length ${_imageBytes!.length}, base64 length: ${_imageBase64!.length}');
        });
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      try {
        final profile = Profile(
          fullName: _nameController.text,
          email: _emailController.text,
          phoneNumber: _phoneController.text,
          profileImageBase64: _imageBase64,
        );
        print('Saving profile: ${profile.toMap()}');
        await _storageService.saveProfile(profile);
        Navigator.pop(context);
      } catch (e) {
        print('Error saving profile: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving profile: $e')),
        );
      }
    } else {
      print('Form validation failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Hero(
                    tag: 'profileImageHero',
                    child: _imageBytes != null
                        ? CircleAvatar(
                      radius: 50,
                      backgroundImage: MemoryImage(_imageBytes!),
                    )
                        : CircleAvatar(
                      radius: 50,
                      backgroundImage:
                      const AssetImage('assets/person.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: _pickImage,
                  child: Text(
                    'Pick Image',
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.blue[800],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.blue[800],
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[600]!
                            : Colors.blue[300]!,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[400]!
                            : Colors.blue[600]!,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.blue[800],
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[600]!
                            : Colors.blue[300]!,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[400]!
                            : Colors.blue[600]!,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value!)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white70
                          : Colors.blue[800],
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[600]!
                            : Colors.blue[300]!,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey[400]!
                            : Colors.blue[600]!,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                  ),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (value.length < 10) {
                      return 'Phone number must be at least 10 digits';
                    }
                    return null;
                  },
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
                  ),
                  onPressed: _saveProfile,
                  child: Text(
                    'Save',
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
    );
  }
}