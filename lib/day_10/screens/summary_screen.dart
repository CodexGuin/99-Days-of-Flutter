import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_10/providers/counter_provider.dart';
import 'package:ninety_nine_days_of_flutter/day_10/providers/shopping_provider.dart';
import 'package:provider/provider.dart';

class SummaryScreen extends StatelessWidget {
  const SummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterValue = context.watch<CounterProvider>().val;
    final totalItems = context.watch<ShoppingProvider>().totalItems;
    final totalAmount = context.watch<ShoppingProvider>().totalAmount;

    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          const Text('Summary Screen', style: TextStyle(fontSize: 30)),
          const SizedBox(height: 20),
          Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(children: [
                SummaryStatistics(
                    statName: 'Total counter',
                    statValue: counterValue.toDouble(),
                    isIntStat: true),
                const SizedBox(height: 10),
                SummaryStatistics(
                    statName: 'Total items',
                    statValue: totalItems.toDouble(),
                    isIntStat: true),
                const SizedBox(height: 10),
                SummaryStatistics(
                    statName: 'Total amount',
                    statValue: totalAmount.toDouble(),
                    isCurrencyStat: true)
              ]))
        ])));
  }
}

class SummaryStatistics extends StatelessWidget {
  final String statName;
  final double statValue;
  final bool isIntStat, isCurrencyStat;

  const SummaryStatistics(
      {super.key,
      required this.statName,
      required this.statValue,
      this.isIntStat = false,
      this.isCurrencyStat = false});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(statName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300)),
      const Spacer(),
      Text(
          isIntStat
              ? statValue.toInt().toString()
              : isCurrencyStat
                  ? '\$${statValue.toStringAsFixed(2)}'
                  : statValue.toString(),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300))
    ]);
  }
}
