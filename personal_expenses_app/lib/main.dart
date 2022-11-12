import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';

void main() => runApp(MyHomePage());

class MyHomePage extends StatelessWidget {
  //String titleInput;
  //String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Expenses App"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  color: Colors.blue,
                      child: Text("Chart!"),
                  elevation: 5,
                ),
              ),
              UserTransactions()
            ],
          ),
        ),
      ),
    );
  }
}

