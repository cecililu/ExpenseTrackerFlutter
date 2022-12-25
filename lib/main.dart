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
  final List<Transaction> transactions=[
    Transaction(id:'t1',title:'New Jordans 4',amount:89.33,date:DateTime.now()),
    Transaction(id:'t2',title:'New Jordans 2',amount:89.33,date:DateTime.now()),
  
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
         
          Card(
            color: Colors.blueAccent,
            child: Text("LIST OF TX"),
            elevation: 5,
          ),
           
        ],
      ),
    );
  }
}
