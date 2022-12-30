import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class Bar extends StatelessWidget {
  
   const Bar({Key key, this.label, this.spendingAmount, this.spendingPercent}) : super(key: key);
  final String label;
  final double spendingAmount;
  final double spendingPercent;


  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
      Text('\$ ${spendingAmount}'),
      SizedBox(height: 4,),
     Container(
      height: 60,
      width: 07,
      child: Stack(
        children: [
         Container(
              decoration: BoxDecoration(
              border: Border.all(color:Colors.green,width: 1),
              borderRadius: BorderRadius.circular(20)
              ),
             
          ),
          FractionallySizedBox(
             heightFactor: spendingPercent,
             child:Container(
             decoration: BoxDecoration(color: Colors.red,
             borderRadius: BorderRadius.circular(20)),
          )) 
          
      ],),
     )
    ],);
  }
}