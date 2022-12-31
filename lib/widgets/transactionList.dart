import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  TransactionList(this.userTransactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text("No data Added YetZZZZZ"),
                  SizedBox(height: 10,),
                  
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
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
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        padding: EdgeInsets.all(12),
                        child: Text(
                          '\$  ${userTransactions[index].amount}',
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical:2.0,horizontal: 0),
                                          child: Text(
                                            userTransactions[index].title,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Text(
                                            DateFormat('yMMMMEEEEd')
                                                .format(userTransactions[index].date),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 10,
                                                color: Colors.grey,)),
                                      ],
                                    ),
                                       Padding(
                                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 12),
                                         child:
                                           IconButton(onPressed: (){}, icon: Icon(Icons.delete),color: Colors.red),
                                         
                                       ),
                                  ],
                                ),
                                        
                                  
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ));
                },
                itemCount: userTransactions.length));
  }
}
