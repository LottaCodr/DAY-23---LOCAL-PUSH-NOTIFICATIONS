import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  static final onNotifications = BehaviorSubject<String?>();
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationsDetails() async {
    return const NotificationDetails(
        android: AndroidNotificationDetails(
            'channel id',
            'channel name',
            channelDescription: 'channel description',
            importance: Importance.max),
        iOS: DarwinNotificationDetails());
  }

  static Future init({bool initScheduled = false}) async {
    final android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = const DarwinInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);

    // await _notifications.initialize(settings,
    // onSelectNotification: (payload) async{
    //   onNotifications.add(payload);
    // },
    // );
  }

  static Future showNotification({
    int id = 0,
    required String? title,
    required String? body,
    required String? payload,
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationsDetails(),
        payload: payload,
      );
}
