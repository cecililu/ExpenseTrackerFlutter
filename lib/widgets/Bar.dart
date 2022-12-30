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
    print('the percent');
    print(spendingPercent);
     print('the amount');
    print(spendingAmount);
    
    return Container(
      padding: EdgeInsets.fromLTRB(3, 2, 3, 2),
    
      margin: EdgeInsets.symmetric(vertical: 0,horizontal: .5),
      color: Color.fromARGB(200, 62, 12, 94),
      child: Column(
      
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Text('\$ ${spendingAmount.truncate()}',textAlign: TextAlign.center,style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.white)),
      
      SizedBox(height: 10,),
     Container(
      height: 60,
      width: 07,
      child: Container(
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
      ),
     ),
      Text('\% ${(spendingPercent*100).toStringAsFixed(1)}',style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.white)),
      Text(' ${label}',style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                        color: Colors.white)),
    ],),
    );
  }
}