import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/booked_appointments_list.dart';
import 'package:oil_frontend_mobile/widgets/buttom_navbar.dart';
import 'package:oil_frontend_mobile/widgets/current_balance.dart';
import 'package:oil_frontend_mobile/widgets/header_one.dart';
import 'package:oil_frontend_mobile/widgets/header_two.dart';
import 'package:oil_frontend_mobile/widgets/icon_button.dart';
import 'package:oil_frontend_mobile/widgets/up_next_list.dart';

class EmployeeHomePage extends StatelessWidget {
  EmployeeHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          HeaderOne(text: 'Home'),
          Row(
            children: [
              HeaderTwo(text: 'Current Balance'),
              Spacer(),
              Image.asset('assets/Icon (3).png'),
            ],
          ),
          CurrentBalance(),
          HeaderTwo(text: 'Up Next'),
          UpNextList(),
          HeaderTwo(text: 'Booked Appointments'),
          BookedAppointmentsList(),
          Spacer(),
          ButtomNavbar(),
          SizedBox(height: 30,),



        ],
      ),
    ));
  }
}
