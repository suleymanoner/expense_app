import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTx;

  NewTransaction(this.addNewTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  bool checkInputs() {
    if (titleController.text.isNotEmpty &&
        amountController.text.isNotEmpty &&
        double.tryParse(amountController.text) >= 0 &&
        double.tryParse(amountController.text) != null) {
      return true;
    } else {
      return false;
    }
  }

  void submitData() {
    widget.addNewTx(
      titleController.text,
      double.parse(amountController.text),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) {
                if (checkInputs()) {
                  submitData();
                } else {
                  return ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill all blanks properly!'),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(bottom: 400),
                    ),
                  );
                }
              },
            ),
            OutlinedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                if (checkInputs()) {
                  submitData();
                } else {
                  return ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill all blanks properly!'),
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.only(bottom: 400),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
