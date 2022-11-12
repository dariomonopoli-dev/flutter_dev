import 'package:flutter/foundation.dart';
//Is not a widget
class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({required this.id, required this.title, required this.amount, required this.date});
}