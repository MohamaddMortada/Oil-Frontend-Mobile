import 'package:flutter/material.dart';

class TogglePhoneEmail extends StatelessWidget {
  final bool isPhoneSelected;
  final Function(int) onToggle;

  const TogglePhoneEmail({
    super.key,
    required this.isPhoneSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 39,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(0), 
              child: Container(
                height: 31,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: isPhoneSelected ? Theme.of(context).primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Phone Number',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isPhoneSelected ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onToggle(1), 
              child: Container(
                height: 31,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: isPhoneSelected ? Colors.transparent : Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Email',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isPhoneSelected ? Colors.black : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
