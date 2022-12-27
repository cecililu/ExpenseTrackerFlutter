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
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(titleLarge: TextStyle(fontFamily: 'Opensans',fontSize: 200))),
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
  @override
  final List<Transaction> _userTransactions = [
   
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
