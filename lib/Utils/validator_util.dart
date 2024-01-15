class ValidatorUtil {
  static bool validate(String? value) {
    if (value == null || value.isEmpty) {
      return true;
    }
    return false;
  }

  // static bool validateAccName(String? value) {
  //   return false;
  // }

  // static bool validateFullName(String? value) {
  //   return false;
  // }

  // static bool validateEmail(String? value) {
  //   return false;
  // }

  // static bool validatePassword(String? value) {
  //   return false;
  // }

  static bool validateConfirmPassword(String? value, String? password) {
    if (value != password) {
      return true;
    }

    return false;
  }

  // static bool validatePhoneNumber(String? value) {
  //   return false;
  // }

  // static bool validateDateOfBirth(String? value) {
  //   return false;
  // }
}
