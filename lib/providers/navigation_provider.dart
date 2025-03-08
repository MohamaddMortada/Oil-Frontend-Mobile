import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}
