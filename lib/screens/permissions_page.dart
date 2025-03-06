import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/custom_button.dart';
import 'package:oil_frontend_mobile/widgets/gradient_bar.dart';
import 'package:oil_frontend_mobile/widgets/header_five.dart';
import 'package:oil_frontend_mobile/widgets/header_one.dart';
import 'package:oil_frontend_mobile/widgets/header_three.dart';

class PermissionsPage extends StatelessWidget {
  const PermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Stack(
      alignment: Alignment.topCenter,
      children: [
        
        GradientBar(),
        Column(
          children: [SizedBox(height: 50,),
          Image.asset('assets/logo outline 1.png'),
        ],),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 150,),
              HeaderOne(text: "Getting Started,\nWe Need Your Permission"),
              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child:
                  Image.asset('assets/Icon.png')),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderThree(text: '\nNotifications'),
                      HeaderFive(
                        text:
                            'Enable notifications to receive timely updates about \nyour appointments and status',
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                  child:
                  Image.asset('assets/Icon (2).png'),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderThree(text: '\nLocation'),
                      HeaderFive(
                        text:
                            'Allow location access to enhance appointment tracking \nand nearby service updates',
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30,),
              CustomButton(text: 'Allow'),
            ],
          ),
        ),
      ],
    ));
  }
}
