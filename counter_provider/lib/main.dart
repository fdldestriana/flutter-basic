import 'package:counter_provider/provider/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: const MaterialApp(
        home: MyHome(),
      ),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    print('REBUILD');
    final counter = Provider.of<Counter>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Counter Provider'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Consumer<Counter>(
            builder: (context, value, child) => Text(
              value.counter.toString(),
              style: const TextStyle(fontSize: 35),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                  onPressed: () {
                    counter.subtractCounter();
                  },
                  onLongPress: () {
                    counter.subtractCounter();
                  },
                  child: const Icon(
                    Icons.remove,
                    size: 30,
                  )),
              TextButton(
                  onPressed: () {
                    counter.addCounter();
                  },
                  onLongPress: (() {
                    counter.addCounter();
                  }),
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
