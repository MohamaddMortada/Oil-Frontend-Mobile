import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/header_eight.dart';
import 'package:oil_frontend_mobile/widgets/header_five.dart';
import 'package:oil_frontend_mobile/widgets/header_four.dart';
import 'package:oil_frontend_mobile/widgets/icon_button.dart';

class OrderCard extends StatelessWidget {
  final String image;
  final String clientName;
  final String orderTime;
  const OrderCard({super.key, required this.image, required this.clientName, required this.orderTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color:Theme.of(context).secondaryHeaderColor),
      child: Row(children: [
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).primaryColor,width: 3),
        ),
        child:CircleAvatar(
          child: Image.asset(image),),
      ),
      SizedBox(width: 15,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        HeaderEight(text: clientName),
        HeaderFive(text: orderTime),
      ],),
      Spacer(),
      Image.asset('assets/angle-right.png'),


    ],));
  }
}