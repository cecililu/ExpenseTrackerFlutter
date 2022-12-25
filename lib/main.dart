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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        children: <Widget>[
          Container(
             width: double.infinity,
            child: Card(
              child: Text("Chart Position"),
              color: Colors.deepOrangeAccent,
            ),
          ),
         
          Card(
            child: Text("LIST OF TX"),
            elevation: 5,
          )
        ],
      ),
    );
  }
}
