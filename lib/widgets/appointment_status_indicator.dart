import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/dashes_widget.dart';
import 'package:oil_frontend_mobile/widgets/header_eleven.dart';

class AppointmentStatusIndicator extends StatelessWidget {
  final Color color;
  final String label;
  final int value;

  const AppointmentStatusIndicator({
    super.key,
    required this.color,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 5),
        HeaderEleven(text: '$label'),
        DashesWidget(),

        HeaderEleven(text: '$value'),
      ],
    );
  }
}
