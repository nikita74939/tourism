import 'package:get/get.dart';
import '../services/notification_service.dart';

class NotificationController extends GetxController {
  final _notificationService = NotificationService();

  Future<void> scheduleNotification({
    required int itineraryId,
    required DateTime notifyTime,
  }) async {
    try {
      await _notificationService.createNotification(
        itineraryId: itineraryId,
        notifyTime: notifyTime,
      );
      Get.snackbar('Success', 'Notification scheduled');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
