class User {
  int? userID;
  final String username;
  final String emailAddress;
  final String encryptedPassword;
  final String? gender;
  final int? age;
  final String? location;
  final double? cgpa;
  final double? cgpaGoal;
  final String? instituteName;

  User({
    this.userID,
    required this.username,
    required this.emailAddress,
    required this.encryptedPassword,
    this.gender,
    this.age,
    this.location,
    this.cgpa,
    this.cgpaGoal,
    this.instituteName,
  });

}