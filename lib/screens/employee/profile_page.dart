import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/appointments_completed.dart';
import 'package:oil_frontend_mobile/widgets/appointments_summary.dart';
import 'package:oil_frontend_mobile/widgets/buttom_navbar.dart';
import 'package:oil_frontend_mobile/widgets/grey_line.dart';
import 'package:oil_frontend_mobile/widgets/header_nine.dart';
import 'package:oil_frontend_mobile/widgets/header_one.dart';
import 'package:oil_frontend_mobile/widgets/logout_button.dart';
import 'package:oil_frontend_mobile/widgets/text_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               HeaderOne(text: 'Profile'),

               LogoutButton(onTap:() => {}),
            ],),
           
            SizedBox(height: 30),
            Image.asset('assets/Frame 1000006529.png'),
            SizedBox(height: 10,),
            HeaderNine(text: 'Alex Carter'),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('assets/Icon (5).png'),
              SizedBox(width: 10,),
              TextButtonGreen(text: 'Edit Profile'),
            ],),
            SizedBox(height: 15,),
            GreyLine(),
            SizedBox(height: 15,),
            AppointmentsCompleted(dateCompleted: 'February 2025', numberCompleted: '24'),
            SizedBox(height: 15,),
            GreyLine(),
            SizedBox(height: 15,),
            AppointmentsSummary(),
            SizedBox(height: 15,),
            GreyLine(),
            Spacer(),
            ButtomNavbar(),
            

          ],
        ),
      ),
    );
  }
}
