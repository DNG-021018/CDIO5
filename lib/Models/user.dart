class User {
  String? accName;
  String? email;
  String? password;
  String? passwordCF;
  String? phoneNumber;
  String? gender;

  User(
      {this.accName,
      this.email,
      this.password,
      this.passwordCF,
      this.phoneNumber,
      this.gender});

  User.fromJson(Map<String, dynamic> json) {
    accName = json['accName'];
    email = json['email'];
    password = json['password'];
    passwordCF = json['passwordCF'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accName'] = accName;
    data['email'] = email;
    data['password'] = password;
    data['passwordCF'] = passwordCF;
    data['phoneNumber'] = phoneNumber;
    data['gender'] = gender;
    return data;
  }
}
