import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Map> transaction;
  const Chart({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  List<Map<String, dynamic>> get chartBarTransactionsValues {
    return List.generate(2, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var i = 0; i < transaction.length; i++) {
        totalSum += transaction[i]['amount'].hashCode;
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 2),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  dynamic get totalSpending {
    return chartBarTransactionsValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      margin: EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: chartBarTransactionsValues.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              dayLable: data['day'],
              spendingAmount: data['amount'],
              totalSpendingAmounts: totalSpending == 0.0
                  ? 0.0
                  : (data['amount'] as double) / totalSpending,
            ),
          );
        }).toList()),
      ),
    );
  }
}
