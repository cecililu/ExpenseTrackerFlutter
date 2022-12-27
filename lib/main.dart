import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
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

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Jordans 4s', amount: 89.33, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Jordans 2', amount: 89.33, date: DateTime.now()),
  ];

  void _addNewTransaction(String titletx, double amounttx) {
    final newTrans = Transaction(
        title: titletx,
        amount: amounttx,
        id: DateTime.now().toString(),
        date: DateTime.now());
    setState(() {
      _userTransactions.add(newTrans);
    });
  }

  void _startAddNewTranasction(ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
               child: NewTransactionForm(_addNewTransaction));
              
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () => _startAddNewTranasction(context),
              icon: Icon(Icons.add))
        ],
        backgroundColor: Colors.deepOrange,
        title: Text(
          'Expense Tracker',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
            TransactionList(_userTransactions)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startAddNewTranasction(context),
          child: Icon(Icons.add)),
    );
  }
}
