class FormValidator {
  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String? ageValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    return null;
  }

  static String? dateOfBirthValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your date of birth';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? GenderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Gender';
    }
    return null;
  }

  static String? PlaceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your place';
    }
    return null;
  }

  static String? PhoneValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  static String? AddressValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Address';
    }
    return null;
  }
    static String? GuardianValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Address';
    }
    return null;
  }
      static String? EducationValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Address';
    }
    return null;
  }
}
