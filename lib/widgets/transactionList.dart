import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text("No data Added YetZZZZZZ"),
                  SizedBox(height: 10,),
                  Container(
                      height: 200,
                      child: Image.asset('assets/image/download.jepg',
                          fit: BoxFit.cover)),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        padding: EdgeInsets.all(12),
                        child: Text(
                          '\$  ${userTransactions[index].amount}',
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
                                  userTransactions[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                Text(
                                    DateFormat('yMMMMEEEEd')
                                        .format(userTransactions[index].date),
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
                },
                itemCount: userTransactions.length));
  }
}
