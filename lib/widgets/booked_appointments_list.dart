import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/booked_appointment_card.dart';

class BookedAppointmentsList extends StatelessWidget {
  const BookedAppointmentsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BookedAppointmentCard(image: 'assets/Avatar.png', clientName: 'Antônio Atez', orderTime: 'Monday, Jan 3 - 08:00 AM'),
      ],);
  }
}