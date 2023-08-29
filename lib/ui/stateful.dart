import 'package:flutter/material.dart';

class IncrementDecrementScreen extends StatefulWidget {
  const IncrementDecrementScreen({super.key});

  @override
  State<IncrementDecrementScreen> createState() =>
      _IncrementDecrementScreenState();
}

class _IncrementDecrementScreenState extends State<IncrementDecrementScreen> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Refresh UI"),
      ),
      body: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            fontSize: 66,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              number++;
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                number--;
              });
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
