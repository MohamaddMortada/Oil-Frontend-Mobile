import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/header_four.dart';
import 'package:oil_frontend_mobile/widgets/header_ten.dart';
import 'package:oil_frontend_mobile/widgets/header_three.dart';

class AppointmentsCompleted extends StatelessWidget {
  final String dateCompleted;
  final String numberCompleted;
  const AppointmentsCompleted({
    super.key,
    required this.dateCompleted,
    required this.numberCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFFF8F9FA), width: 4),
          bottom: BorderSide(color: Color(0xFFF8F9FA), width: 4),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderThree(text: 'Completed Appointments'),
              HeaderFour(text: dateCompleted),
            ],
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: HeaderTen(text: numberCompleted),
          ),
        ],
      ),
    );
  }
}
