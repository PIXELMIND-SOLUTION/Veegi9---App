class User {
  final String userId;
  final String fullName;
  final String email;
  final String phoneNumber;
  String? referralCode;

  User({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    this.referralCode
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      referralCode: json['referralCode'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'referralCode': referralCode
    };
  }

  @override
  String toString() {
    return 'User(userId: $userId, fullName: $fullName, email: $email, phoneNumber: $phoneNumber, referralCode: $referralCode)';
  }
}