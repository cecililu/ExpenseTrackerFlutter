import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key key, this.label, this.spendingAmount, this.spendingPercent}) : super(key: key);
final String label;
final double spendingAmount;
final double spendingPercent;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('\$ s\{$spendingAmount.toStringAsFixed(0)} '),
      SizedBox(height: 4,),
     Container(
      height: 60,
      width: 10,
      child: Stack(children: [
        Container(
             decoration: BoxDecoration(
              border: Border.all(color:Colors.grey,width: 1),
            
              ),
           
      
          ),
          FractionallySizedBox(heightFactor: spendingPercent,child:Container(
            decoration: BoxDecoration(color: Colors.red),
          )) 
          
      ],),
     )
    ],);
  }
}