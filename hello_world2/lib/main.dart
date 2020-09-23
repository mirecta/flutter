import 'package:flutter/material.dart';
import 'models/transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);
  final List<Transaction> transactons = [
    Transaction(
        id: 't1', title: "new shoes", amount: 69.99, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: "weekly groceries",
        amount: 16.53,
        date: DateTime.now()),
  ];
  // String titleInput;
  // String amountInput;
  final titleEditingController = TextEditingController();
  final amountEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter App"),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("Chart"),
              elevation: 5,
            ),
          ),
          Card(
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
                    controller: this.titleEditingController,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    /*onChanged: (value) {
                      amountInput = value;
                    },*/
                    controller: this.amountEditingController,
                  ),
                  FlatButton(
                      onPressed: () {
                        print(titleEditingController.text);
                        print(amountEditingController.text);
                      },
                      textColor: Colors.purple,
                      child: Text('Add transaction'))
                ],
              ),
            ),
          ),
          Column(
              children: transactons.map((e) {
            return Card(
                elevation: 3,
                child: Row(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      )),
                      child: Text(
                        '\$${e.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          e.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          DateFormat('dd.MM.yyyy').format(e.date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
          }).toList()),
        ],
      ),
    );
  }
}
