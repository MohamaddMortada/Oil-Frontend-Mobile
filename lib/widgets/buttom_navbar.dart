import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/header_five.dart';

class ButtomNavbar extends StatelessWidget {
  const ButtomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(children: [
          Image.asset('assets/home-04.png'),
          SizedBox(height: 5,),
          HeaderFive(text: 'Home'),
        ]),
        Spacer(),
        Column(children: [
          Image.asset('assets/calendar-02.png'),
          SizedBox(height: 5,),
          HeaderFive(text: 'Calender'),
        ]),
        Spacer(),
        Column(children: [
          Image.asset('assets/receipt-lines.png'),
          SizedBox(height: 5,),
          HeaderFive(text: 'Transactions'),
        ]),
        Spacer(),
        Column(children: [
          Image.asset('assets/user-profile-03.png'),
          SizedBox(height: 5,),
          HeaderFive(text: 'Profile'),
        ]),

      ],
    );
  }
}