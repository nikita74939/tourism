import 'constants.dart';

class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return AppStrings.emailInvalid;
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }

    if (value.length < AppConstants.minPasswordLength) {
      return AppStrings.passwordTooShort;
    }

    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }

    if (value.length > AppConstants.maxNameLength) {
      return 'Name is too long';
    }

    return null;
  }

  static String? validateRequired(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return fieldName != null
          ? '$fieldName is required'
          : AppStrings.fieldRequired;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return AppStrings.fieldRequired;
    }

    if (value != password) {
      return AppStrings.passwordNotMatch;
    }

    return null;
  }

  static String? validateDate(DateTime? date) {
    if (date == null) {
      return 'Please select a date';
    }
    return null;
  }

  static String? validateDateRange(DateTime? startDate, DateTime? endDate) {
    if (startDate == null || endDate == null) {
      return 'Please select both dates';
    }

    if (endDate.isBefore(startDate)) {
      return 'End date must be after start date';
    }

    return null;
  }
}
