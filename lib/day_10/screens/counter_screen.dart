import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_10/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(context.watch<CounterProvider>().val.toString(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.w300)))
            ]),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
              onPressed: () => context.read<CounterProvider>().increment(),
              child: const Icon(Icons.add)),
          const SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () => context.read<CounterProvider>().decrement(),
              child: const Icon(Icons.remove))
        ]));
  }
}
