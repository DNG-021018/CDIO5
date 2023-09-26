class User {
  String? accName;
  String? fullName;
  String? email;
  String? password;
  String? passwordCF;
  String? phoneNumber;
  String? dateOfBirth;
  String? gender;

  User(
      {this.accName,
      this.fullName,
      this.email,
      this.password,
      this.passwordCF,
      this.phoneNumber,
      this.dateOfBirth,
      this.gender});

  User.fromJson(Map<String, dynamic> json) {
    accName = json['accName'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    passwordCF = json['passwordCF'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accName'] = accName;
    data['fullName'] = fullName;
    data['email'] = email;
    data['password'] = password;
    data['passwordCF'] = passwordCF;
    data['phoneNumber'] = phoneNumber;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    return data;
  }
}
