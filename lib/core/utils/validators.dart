class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return "Email cannot be empty";
    if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
        .hasMatch(value)) {
      return "Enter a valid email";
    }
    return null;
  }
}
