class Validations {
    static bool isValidEmail(String email) {
      final emailRegex = RegExp(
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
      );
      return emailRegex.hasMatch(email);
    }

    static bool isValidPhoneNumber(String phone) {
      final phoneRegex = RegExp(r'^\d{8,15}$');
      return phoneRegex.hasMatch(phone);
    }
}