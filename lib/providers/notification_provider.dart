/*import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationProvider with ChangeNotifier {
  bool _isGranted = false;

  bool get isGranted => _isGranted;

  Future<void> requestNotificationPermission() async {
    PermissionStatus status = await Permission.notification.request();

    _isGranted = status.isGranted;
    notifyListeners();
  }
}*/
