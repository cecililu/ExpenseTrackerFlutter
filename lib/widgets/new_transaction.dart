
import 'package:flutter/material.dart';
class NewTransactionForm extends StatelessWidget {

 NewTransactionForm(this.addTxt);
    
 final titleContoller=TextEditingController();
 final inputContoller=TextEditingController();


 final Function addTxt;
  
  @override
  Widget build(BuildContext context) {
    return Card(
              child: Container(
            margin: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("Add new Entry"),
                TextField(
                  autocorrect: true,
                  autofocus: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(labelText: "Expense title"),
                  controller:titleContoller
                ),
                TextField(
                  autocorrect: true,
                  autofocus: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(labelText: "Expense Amount"),
                  controller:inputContoller
                ),
                TextButton(
                  child: Text('Add'),
                  onPressed: () {
                    addTxt(titleContoller.text,inputContoller);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                )
              ],  
            ),
          ));
  }
}