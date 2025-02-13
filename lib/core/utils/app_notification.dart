import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:retail_mobile/config/app_colors.dart';

class AppNotification {
  static const String _notificationChannelKey = 'retail_pos_app_notification';
  static const String _notificationChannelName = 'Retail Pos App Notification';

  static bool notificationInitialized = false;

  static void changeNotificationInitializedStatus() =>
      notificationInitialized = !notificationInitialized;

  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      'resource://drawable/notification',
      [
        NotificationChannel(
          channelKey: _notificationChannelKey,
          channelName: _notificationChannelName,
          channelDescription:
              'Notification channel for application notifications',
          defaultColor: AppColors.primaryButtonColor,
          importance: NotificationImportance.Max,
          criticalAlerts: true,
          playSound: true,
        ),
      ],
    );
  }

  static void setupForegroundNotificationListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final data = message.data;
      if (message.notification != null) {
        final payload = <String, String?>{};
        for (final a in data.entries) {
          payload[a.key] = a.value as String?;
        }
        AwesomeNotifications().createNotification(
          content: NotificationContent(
            id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
            channelKey: _notificationChannelKey,
            title: message.notification?.title ?? 'Alert!',
            body: message.notification?.body ?? '',
            backgroundColor: AppColors.whiteColor,
            payload: payload,
            bigPicture: data['image'] as String?,
            notificationLayout: data['image'] != null
                ? NotificationLayout.BigPicture
                : NotificationLayout.Default,
          ),
        );
      }
    });
  }
}
