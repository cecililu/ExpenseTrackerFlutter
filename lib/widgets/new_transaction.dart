import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransactionForm extends StatefulWidget {
  NewTransactionForm(this.addTxt);

  final Function addTxt;

  @override
  State<NewTransactionForm> createState() => _NewTransactionFormState();
}

class _NewTransactionFormState extends State<NewTransactionForm> {
  final titleContoller = TextEditingController();

  final inputContoller = TextEditingController();
  final i = TextEditingController();
    DateTime  _selectedDate;
  void _datepicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021, 1, 1),
        lastDate: DateTime.now()).then((val){
        if (val==null){
          return;
        }
        setState(() {
          _selectedDate=val;
        });
        
        }
        );

  }

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
          Container(
              height: 70,
              child: Row(children: [
                Text(_selectedDate==null?"No date chosen":DateFormat.yMEd(_selectedDate)),
                TextButton(
                  onPressed: _datepicker,
                  child: Text('Choose a date'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 72, 5, 99)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white)),
                ),
              ])),
          TextButton(
            child: Text('Add'),
            onPressed: submitData,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 72, 5, 99)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white)),
          )
        ],
      ),
    ));
  }
}
