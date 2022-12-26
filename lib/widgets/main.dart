import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transactionList.dart';


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
 

  String titleInput;
  String amountInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.deepOrange,
        title: Text('Expense Tracker',textAlign: TextAlign.center,),
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
            margin: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Add new Entry"),
                TextField(
                  autocorrect: true,
                  autofocus: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(labelText: "Expense title"),
                  onChanged: ((value) {
                    titleInput = value;
                  }),
                ),
                TextField(
                  autocorrect: true,
                  autofocus: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(labelText: "Expense Amount"),
                  onChanged: (val) {
                    amountInput = val;
                  },
                ),
                TextButton(
                  child: Text('Add'),
                  onPressed: () {
                    
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                )
              ],  
            ),
          )),
          TransactionList()
        ],
      ),
    );
  }
}
