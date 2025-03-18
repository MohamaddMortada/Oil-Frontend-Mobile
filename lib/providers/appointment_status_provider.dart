import 'package:flutter/material.dart';

class AppointmentStatusProvider extends ChangeNotifier {
  int completed = 21;
  int cancelled = 1;
  int pending = 12;

  int get total => completed + cancelled + pending;

  double get completedPercentage => total == 0 ? 0 : completed / total;
  double get cancelledPercentage => total == 0 ? 0 : cancelled / total;
  double get pendingPercentage => total == 0 ? 0 : pending / total;
}