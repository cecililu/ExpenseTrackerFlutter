import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            padding: EdgeInsets.all(20),
            color: Colors.deepOrangeAccent,
            child: Card(
              child: Text(
                "Chart Position",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Card(
              child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Add new Entry"),
                TextField(
                  autocorrect: true,
                  autofocus: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(labelText: "Expense title"),
                ),
                TextField(
                  autocorrect: true,
                  autofocus: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(labelText: "Expense Amount"),
                ),
                TextButton(
                  child: Text('Add'),
                  onPressed: () {},
                  style: ButtonStyle(
                  
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white)
                  ),
                )
              ],
            ),
          )),
          Column(
              children: transactions.map((transaction) {
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
                          Text(
                              DateFormat('yMMMMEEEEd').format(transaction.date),
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
          }).toList())
        ],
      ),
    );
  }
}
