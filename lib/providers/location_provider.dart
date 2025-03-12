import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationProvider extends ChangeNotifier {
  PermissionStatus _status = PermissionStatus.denied;

  PermissionStatus get status => _status;

  Future<void> requestLocationPermission() async {
    _status = await Permission.location.request();
    print(_status);
    notifyListeners();
  }

  Future<void> checkPermissionStatus() async {
    _status = await Permission.location.status;
    print(_status);
    notifyListeners();
  }

  void openSettings() {
    openAppSettings();
  }
}
