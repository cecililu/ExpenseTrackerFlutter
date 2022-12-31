import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/Bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
   
   List <Transaction> recentTransaction;
  
   Chart(_recentTransaction) {
    this.recentTransaction=_recentTransaction;
  }
 
 
 
  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum=0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
              print('match found ');
          totalSum = totalSum + recentTransaction[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print('total sum');
      return {'day': DateFormat.E().format(weekDay), 
      'amount': totalSum
      };
    }
    );
  }

  double get maxSpending {
    return groupedTransaction.fold(0.0, (sum, it) {
      var ns = (sum) + (it['amount']);
      return ns;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Grouped tranasction");
    print(groupedTransaction);
    return Container(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child:Card(
          elevation: 18,
          
          
          child: FittedBox(
            child: 
                          Row(   
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: groupedTransaction.map((data) {
                    print(data['amount']);
                    double sp = (data['amount'] as double) / maxSpending;
                    String day='${data['day']}';
                return Container(
                  child: Bar(
                    label: day,
                    spendingAmount: data['amount'] as double,
                    spendingPercent: sp,
                  ),
                );
              }).toList()),
            
          )) ,
      ),
    );
  }
}
