import 'package:flutter/material.dart';

class AppointmentSummaryStatusWidget extends StatelessWidget {
  final String text;
  const AppointmentSummaryStatusWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if(text == 'Completed')
          Container(
          padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          decoration: BoxDecoration(
            color: Color(0xFFECF6DF),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(text,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),),
      if(text == 'Canceled')
          Container(
          padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
          decoration: BoxDecoration(
            color: Color(0xFFDD2424),
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(text,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),),
      
      
    ],);
    
  }
}