import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/filter_provider.dart'; 

class FilterButton extends StatelessWidget {
  final String text;
  const FilterButton({super.key, required this.text});

  Color getColor(String text) {
    switch (text) {
      case 'Confirmed':
      case 'All':
        return Colors.green;
      case 'Ongoing':
        return Colors.blue;
      case 'Pending':
        return Colors.orange;
      case 'Cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FilterProvider>(context); 

    bool isSelected = filterProvider.isSelected(text);
    Color color = getColor(text);

    return GestureDetector(
      onTap: () {
        filterProvider.setFilter(text); 
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: color, 
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: color,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400, 
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
