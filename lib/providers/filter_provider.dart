import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  List<String> selectedFilters = [];

  void setFilter(String filter) {
    if (filter == 'All') {
      if (selectedFilters.contains('All')) {
        selectedFilters.clear();
      } else {
        selectedFilters = ['All', 'Confirmed', 'Ongoing', 'Pending', 'Cancelled'];
      }
    } else {
      if (selectedFilters.contains(filter)) {
        selectedFilters.remove(filter);
      } else {
        selectedFilters.add(filter);
      }
    }
    notifyListeners();
  }

  bool isSelected(String filter) {
    return selectedFilters.contains(filter);
  }
}
