import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../utils/constants.dart';
import 'api_service.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();
  final _api = ApiService();

  static Future<void> init() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings();

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(initSettings);
  }

  Future<void> createNotification({
    required int itineraryId,
    required DateTime notifyTime,
  }) async {
    await _api.post(
      '/notifications',
      data: {
        'itinerary_id': itineraryId,
        'notify_time': notifyTime.toIso8601String(),
      },
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      AppConstants.notificationChannelId,
      AppConstants.notificationChannelName,
      channelDescription: AppConstants.notificationChannelDesc,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _notifications.show(id, title, body, details);
  }
}
