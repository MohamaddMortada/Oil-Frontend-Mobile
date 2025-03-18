import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/customed_textfield_two.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int i=0;
    return Container(
      padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
      height: 42,
      decoration: BoxDecoration(
        color: Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(1000),
      ),
      child: Row(children: [
        Image.asset('assets/Search.png'),
        SizedBox(width: 10,),
        CustomedTextfieldTwo(text: 'Search'),
        
      ],),);
  }
}