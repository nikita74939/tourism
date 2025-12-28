import 'package:intl/intl.dart';
import 'dart:math' as math;

class Helpers {
  // Date Formatting
  static String formatDate(DateTime date, {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  static String formatDateTime(DateTime date,
      {String format = 'dd MMM yyyy HH:mm'}) {
    return DateFormat(format).format(date);
  }

  static String formatTime(DateTime date, {String format = 'HH:mm'}) {
    return DateFormat(format).format(date);
  }

  static String formatRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      return '${(difference.inDays / 365).floor()} years ago';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  // Currency Formatting
  static String formatCurrency(double amount, {String symbol = 'Rp'}) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: symbol,
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  static String formatNumber(double number, {int decimalDigits = 0}) {
    final formatter = NumberFormat.decimalPattern('id_ID');
    if (decimalDigits > 0) {
      return number.toStringAsFixed(decimalDigits);
    }
    return formatter.format(number);
  }

  // Distance Calculation
  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const earthRadius = 6371; // km

    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);

    final a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

    return earthRadius * c;
  }

  static double _toRadians(double degree) {
    return degree * math.pi / 180;
  }

  static String formatDistance(double distanceInKm) {
    if (distanceInKm < 1) {
      return '${(distanceInKm * 1000).toStringAsFixed(0)} m';
    } else {
      return '${distanceInKm.toStringAsFixed(1)} km';
    }
  }

  // String Utilities
  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static String truncate(String text, int maxLength) {
    if (text.length <= maxLength) return text;
    return '${text.substring(0, maxLength)}...';
  }

  // Validation
  static bool isValidUrl(String url) {
    try {
      Uri.parse(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Trip Status
  static String getTripStatus(DateTime startDate, DateTime endDate) {
    final now = DateTime.now();

    if (now.isBefore(startDate)) {
      return 'upcoming';
    } else if (now.isAfter(endDate)) {
      return 'past';
    } else {
      return 'ongoing';
    }
  }

  static String getTripStatusLabel(DateTime startDate, DateTime endDate) {
    final status = getTripStatus(startDate, endDate);

    switch (status) {
      case 'upcoming':
        return 'Upcoming';
      case 'ongoing':
        return 'Ongoing';
      case 'past':
        return 'Completed';
      default:
        return 'Unknown';
    }
  }

  // Parse ISO Date
  static DateTime? parseIsoDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) return null;
    try {
      return DateTime.parse(dateString);
    } catch (e) {
      return null;
    }
  }

  // Format to ISO
  static String toIsoString(DateTime date) {
    return date.toIso8601String();
  }
}
