class User {
  User({
    required this.lastName,
    required this.firstName,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  final String lastName;
  final String firstName;
  final String email;
  final String password;
  final String phoneNumber;
}
