import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/appointment_summary_status_widget.dart';
import 'package:oil_frontend_mobile/widgets/header_thirteen.dart';
import 'package:oil_frontend_mobile/widgets/header_twelve.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5), 
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 5), 
                blurRadius: 10, 
                spreadRadius: 0, 
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              border: Border.all(
                color: const Color(0xFFDDDDDD).withOpacity(0.5),
              ),
            ),
            child: Row(
              children: [
                const HeaderTwelve(text: 'February 03, 2025', opacity: 0.5),
                const Spacer(),
                const HeaderTwelve(text: '13:00 - 14:00', opacity: 0.5),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5), 
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 5), 
                blurRadius: 10,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
              border: Border.all(
                color: const Color(0xFFDDDDDD).withOpacity(0.5),
              ),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const HeaderThirteen(text: '#87623492'),
                    const Spacer(),
                    const AppointmentSummaryStatusWidget(text: 'Completed'),
                  ],
                ),
                Row(
                  children: [
                    const HeaderTwelve(text: 'Client:', opacity: 1),
                    const Spacer(),
                    const HeaderTwelve(text: 'Maria Manuela', opacity: 0.5),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
