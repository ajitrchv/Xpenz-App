import 'package:app3/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chartbar.dart';

class chart extends StatelessWidget {
  final List<Transaction> recentTrax;
  chart(this.recentTrax);

  List<Map<String, Object>> get groupTrax {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      // ignore: unused_local_variable
      var totalsum = 0.0;
      for (var i = 0; i < recentTrax.length; i++) {
        if (recentTrax[i].dt.day == weekDay.day &&
            recentTrax[i].dt.month == weekDay.month &&
            recentTrax[i].dt.year == weekDay.year) {
          totalsum += recentTrax[i].amount;
        }
      }

    

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalsum
      };
    });
  }

  double get maxSpending {
    return groupTrax.fold(0.0, (sum, item) {
      return (sum + (item['amount'] as double));
    });
  }
 
  Widget build(BuildContext context) {
    
    return (Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding:EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupTrax.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: chartbar(
                  data['day'].toString(),
                  (data['amount'] as double),
                  ((data['amount'] as double) /
                      ((maxSpending>0) ? maxSpending : 1))),
            );
          }).toList(),
        ),
      ),
    ));
  }
}
