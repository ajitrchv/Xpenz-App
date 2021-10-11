import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addtx;

  NewTransaction(this.addtx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleControl = TextEditingController();

  final amountControl = TextEditingController();

  DateTime selectedDate= DateTime.now();

  void submitFunc() {
    String title = titleControl.text.toString();
    double amount = double.parse(amountControl.text);

    if(amountControl.text.isEmpty) return;

    if (title.isEmpty || amount <= 0 || selectedDate == null) return;

    widget.addtx(title, amount, selectedDate);
    Navigator.of(context).pop();
  }

  // ignore: non_constant_identifier_names
  void ShowDate() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  Widget build(BuildContext context) {
    return (Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              cursorColor: Colors.purple,
              controller: titleControl,
              onSubmitted: (_) => submitFunc(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              cursorColor: Colors.purple,
              controller: amountControl,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitFunc(),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    // ignore: unnecessary_null_comparison
                    selectedDate == null
                        ? 'No Date Choosen'
                        : 'Picked: ${DateFormat.yMMMd().format(selectedDate)}',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                TextButton(
                  child: Text(
                    'Choose Date',
                    style: TextStyle(
                        color: Colors.teal, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => ShowDate(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: submitFunc,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal)),
                child: Text(
                  'Add Transaction',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
