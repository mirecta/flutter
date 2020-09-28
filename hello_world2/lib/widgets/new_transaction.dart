import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              /*onChanged: (value) {
                      titleInput = value;
                    },*/
              controller: this.titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              /*onChanged: (value) {
                      amountInput = value;
                    },*/
              controller: this.amountController,
            ),
            FlatButton(
                onPressed: () {
                  addTx(titleController.text,
                      double.parse(amountController.text));
                  print(titleController.text);
                  print(amountController.text);
                },
                textColor: Colors.purple,
                child: Text('Add transaction'))
          ],
        ),
      ),
    );
  }
}
