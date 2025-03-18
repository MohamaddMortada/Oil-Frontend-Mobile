import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/appointment_status_widget.dart';
import 'package:oil_frontend_mobile/widgets/header_three.dart';
import 'package:oil_frontend_mobile/widgets/text_button.dart';

class AppointmentsSummary extends StatelessWidget {
  const AppointmentsSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
        HeaderThree(text: 'Appointments Summary'),
        Spacer(),
        TextButtonGreen(text: 'See Details'),
        ],),
        SizedBox(height: 20,),
        AppointmentStatusWidget(),
      
     


    ],);
  }
}