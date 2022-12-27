import 'package:flutter/material.dart';

import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:flutter_complete_guide/widgets/Bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  Chart({Key key, this.recentTransaction}) : super(key: key);

  final List<Transaction> recentTransaction;
  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum = totalSum + recentTransaction[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  double get maxSpending {
    return groupedTransaction.fold(0.0, (sum, it) {
      var ns = (sum) + (it['amount']);
      return 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Row(
            children: groupedTransaction.map((data) {
              print(data['amount']);
            // double sp = (data['amount'] as double) / maxSpending;
          return MyWidget(spendingPercent:10, spendingAmount: data['amount']);
        }).toList()));
  }
}
