import 'package:flutter/cupertino.dart';
import 'package:flutter_complete_guide/models/transaction.dart';

import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transactionList.dart';


class UserTransaction extends StatefulWidget {
  const UserTransaction({Key key}) : super(key: key);


  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

   final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Jordans 4s', amount: 89.33, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Jordans 2', amount: 89.33, date: DateTime.now()),
  ];
 
   void _addNewTransaction(String titletx,double amounttx){
       final newTrans=Transaction(
        title:titletx,
        amount:amounttx,
        id:DateTime.now().toString(),
        date: DateTime.now()
      
        );
        setState(() {
          _userTransactions.add(newTrans);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
         NewTransactionForm(_addNewTransaction),
         TransactionList(_userTransactions)
      ],
    );
  }
}