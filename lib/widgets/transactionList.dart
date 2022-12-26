import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatefulWidget {
  TransactionList({Key key}) : super(key: key);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final List<Transaction> userTransactions = [
    Transaction(
        id: 't1', title: 'New Jordans 4s', amount: 89.33, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Jordans 2', amount: 89.33, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        children: userTransactions.map((transaction) {
      return Card(
          child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                width: 2,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: EdgeInsets.all(12),
            child: Text(
              '\$  ${transaction.amount}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 25),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      transaction.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          color: Colors.black),
                    ),
                    Text(DateFormat('yMMMMEEEEd').format(transaction.date),
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: Colors.grey)),
                  ],
                ),
              )
            ],
          )
        ],
      ));
    }).toList());
  }
}
