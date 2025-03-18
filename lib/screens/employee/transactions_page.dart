import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/header_one.dart';
import 'package:oil_frontend_mobile/widgets/transaction_card.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(padding: EdgeInsets.all(20),
      child:
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      SizedBox(height: 30,),
      HeaderOne(text: 'Transactions'),
      SizedBox(height: 30,),

      TransactionCard(transactionDate: 'Friday, Jan 3 - 04:00 PM', orderId: 'Transfer', transactionValue: '-7,800,000 LBP'),
      TransactionCard(transactionDate: 'Thursday, Jan 2 - 02:00 PM', orderId: 'Order #87622355-CC', transactionValue: '+28.50 USD')
    ],)));
  }
}