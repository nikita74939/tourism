import 'package:flutter/material.dart';

class AppConstants {
  // API Configuration
  static const String baseUrl = 'http://localhost:3000/api';
  static const String apiTimeout = '30';

  // Storage Keys
  static const String tokenKey = 'auth_token';
  static const String userKey = 'user_data';
  static const String isLoggedInKey = 'is_logged_in';

  // App Info
  static const String appName = 'Tourism App';
  static const String appVersion = '1.0.0';

  // Validation
  static const int minPasswordLength = 6;
  static const int maxNameLength = 100;

  // Location
  static const double defaultRadius = 50.0; // km
  static const double maxRadius = 100.0; // km

  // Map
  static const double defaultZoom = 15.0;
  static const double defaultLat = -7.7928; // Yogyakarta
  static const double defaultLng = 110.3658;

  // Notification
  static const String notificationChannelId = 'tourism_notifications';
  static const String notificationChannelName = 'Tourism Notifications';
  static const String notificationChannelDesc =
      'Notifications for trip reminders';

  // Activity Types
  static const List<String> activityTypes = [
    'walking',
    'idle',
    'traveling',
    'running',
    'cycling',
  ];

  // Currency Codes
  static const List<String> popularCurrencies = [
    'IDR',
    'USD',
    'EUR',
    'GBP',
    'JPY',
    'SGD',
    'MYR',
  ];
}

class AppColors {
  // Primary Colors
  static const primaryColor = Color(0xFF2196F3);
  static const primaryDark = Color(0xFF1976D2);
  static const primaryLight = Color(0xFFBBDEFB);

  // Accent Colors
  static const accentColor = Color(0xFFFF5722);
  static const accentLight = Color(0xFFFFCCBC);

  // Background
  static const backgroundColor = Color(0xFFF5F5F5);
  static const cardColor = Color(0xFFFFFFFF);

  // Text
  static const textPrimary = Color(0xFF212121);
  static const textSecondary = Color(0xFF757575);
  static const textHint = Color(0xFFBDBDBD);

  // Status
  static const successColor = Color(0xFF4CAF50);
  static const warningColor = Color(0xFFFFC107);
  static const errorColor = Color(0xFFF44336);
  static const infoColor = Color(0xFF2196F3);

  // Others
  static const dividerColor = Color(0xFFE0E0E0);
  static const shadowColor = Color(0x1A000000);
}

class AppStrings {
  // Auth
  static const String login = 'Login';
  static const String register = 'Register';
  static const String logout = 'Logout';
  static const String email = 'Email';
  static const String password = 'Password';
  static const String name = 'Name';
  static const String confirmPassword = 'Confirm Password';

  // Navigation
  static const String home = 'Home';
  static const String explore = 'Explore';
  static const String planner = 'Planner';
  static const String profile = 'Profile';

  // Messages
  static const String loginSuccess = 'Login successful';
  static const String registerSuccess = 'Registration successful';
  static const String logoutSuccess = 'Logout successful';
  static const String errorOccurred = 'An error occurred';
  static const String noInternet = 'No internet connection';
  static const String sessionExpired = 'Session expired. Please login again';

  // Validation
  static const String fieldRequired = 'This field is required';
  static const String emailInvalid = 'Invalid email address';
  static const String passwordTooShort =
      'Password must be at least 6 characters';
  static const String passwordNotMatch = 'Passwords do not match';

  // Empty States
  static const String noData = 'No data available';
  static const String noTrips = 'No trips planned yet';
  static const String noDestinations = 'No destinations found';
  static const String noActivities = 'No activities recorded';
}
