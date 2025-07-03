class Profile {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? profileImageBase64; // Store base64 string instead of path

  Profile({
    this.fullName,
    this.email,
    this.phoneNumber,
    this.profileImageBase64,
  });

  Map<String, String> toMap() {
    return {
      'fullName': fullName ?? '',
      'email': email ?? '',
      'phoneNumber': phoneNumber ?? '',
      'profileImageBase64': profileImageBase64 ?? '',
    };
  }

  factory Profile.fromMap(Map<String, String> map) {
    return Profile(
      fullName: map['fullName'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      profileImageBase64: map['profileImageBase64'],
    );
  }
}