class EmailValidator {
  EmailValidator._();

  static String? emailValidation(String? email) {
    final newValue = email!.trim();

    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(newValue)) {
      return 'Email no válido';
    }
    return null;
  }
}
