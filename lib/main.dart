import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transactionList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(fontFamily: 'Opensans', fontSize: 200))),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: DateTime.now().toIso8601String(),amount: 200,date: DateTime.now(),title: 'Jordan 1')
  ];
  List<Transaction> get _recentTranasctions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

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
        backgroundColor: Theme.of(context).primaryColorDark,
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
            Chart( _recentTranasctions),
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
