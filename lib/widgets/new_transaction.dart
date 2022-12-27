import 'package:flutter/material.dart';

class NewTransactionForm extends StatefulWidget {
  
  NewTransactionForm(this.addTxt);
  

  final Function addTxt;

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final titleContoller = TextEditingController();

  final inputContoller = TextEditingController();

  void submitData() {
   
    final enteredTitle = titleContoller.text;
    final enteredinput = double.parse(inputContoller.text);
    if (enteredTitle.isEmpty || enteredinput <= 0) {
      return;
    }

    widget.addTxt(enteredTitle, enteredinput);
    Navigator.of(context).pop();
  }

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
            controller: titleContoller,
            onSubmitted: (_) => submitData(),
          ),
          TextField(
            autocorrect: true,
            autofocus: true,
            cursorColor: Colors.red,
            decoration: InputDecoration(labelText: "Expense Amount"),
            controller: inputContoller,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => submitData(),
          ),
          TextButton(
            child: Text('Add'),
            onPressed: submitData,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          )
        ],
      ),
    ));
  }
}
