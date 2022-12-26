import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New Jordans 4', amount: 89.33, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Jordans 2', amount: 89.33, date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text("Chart Position"),
              color: Colors.deepOrangeAccent,
            ),
          ),
          Column(
              children: transactions.map((transaction) {
            return Card(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center ,
              children: <Widget>[
                Container(
                  color: Colors.green,
      
                  child: Text(transaction.amount.toString()),
                ),
                Column(
                  
                  children: <Widget>[
                  Card(  
                    color:Colors.red,
                  child: Column(
                    children: <Widget>[
                      Text(transaction.title),
                      Text(transaction.date.toString()),
                    ],
                  ),
                  )
                ],)
              ],
            ));
          }).toList())
        ],
      ),
    );
  }
}
