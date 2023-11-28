import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instant2/ui/e/ui/e_login_screen.dart';
import 'package:instant2/ui/state_management/counter/counter_cubit.dart';

class CounterPage extends StatefulWidget {
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final cubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('Counter')),
        body: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            print('Current State => $state');
            return Center(
              child: Text(
                '$state',
                style: const TextStyle(fontSize: 66),
              ),
            );
          },
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => cubit.increment(),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              child: const Icon(Icons.keyboard_return),
              onPressed: () => cubit.reset(),
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                cubit.decrement();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ELoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
