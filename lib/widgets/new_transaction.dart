import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTx;

  NewTransaction(this.addNewTx);

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
    addNewTx(
      titleController.text,
      double.parse(amountController.text),
    );
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
                    ),
                  );
                }
              },
            ),
            OutlinedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: () {
                if (checkInputs()) {
                  submitData();
                } else {
                  return ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please fill all blanks properly!'),
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
