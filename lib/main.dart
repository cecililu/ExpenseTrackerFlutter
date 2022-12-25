import 'package:flutter/material.dart';

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
  final List
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
