class TimeService {
  static DateTime now() => DateTime.now();

  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  static DateTime addHours(DateTime date, int hours) {
    return date.add(Duration(hours: hours));
  }

  static DateTime addMinutes(DateTime date, int minutes) {
    return date.add(Duration(minutes: minutes));
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  static bool isToday(DateTime date) {
    return isSameDay(date, now());
  }

  static bool isTomorrow(DateTime date) {
    return isSameDay(date, addDays(now(), 1));
  }

  static bool isYesterday(DateTime date) {
    return isSameDay(date, addDays(now(), -1));
  }
}
