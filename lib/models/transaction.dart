import 'package:flutter/foundation.dart';
class Transaction{
  String id;
  String name;
  double amount;
  DateTime dt;

  Transaction({required this.id,required this.name,required this.amount,required this.dt});

}