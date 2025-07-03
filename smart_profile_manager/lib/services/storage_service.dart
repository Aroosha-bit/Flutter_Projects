import 'package:shared_preferences/shared_preferences.dart';
import '../models/profile.dart';

class StorageService {
  static const String _profileKey = 'profile';

  Future<void> saveProfile(Profile profile) async {
    final prefs = await SharedPreferences.getInstance();
    final profileMap = profile.toMap();
    print('Saving profile map: $profileMap'); // Debug log
    await prefs.setString(_profileKey, profileMap.toString());
  }

  Future<Profile?> getProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final profileString = prefs.getString(_profileKey);
    if (profileString != null) {
      final map = Map<String, String>.from(
        Map.fromEntries(
          profileString
              .replaceAll('{', '')
              .replaceAll('}', '')
              .split(', ')
              .map((e) {
            final parts = e.split(': ');
            return MapEntry(parts[0], parts[1]);
          }),
        ),
      );
      print('Loaded profile map: $map'); // Debug log
      return Profile.fromMap(map);
    }
    return null;
  }

  Future<void> clearProfile() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_profileKey);
  }
}