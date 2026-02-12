import 'package:dart_eval/dart_eval_bridge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_eval/flutter_eval.dart';
import 'package:flutter_eval/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HotSwapLoader(
      uri: 'https://raw.githubusercontent.com/abubakarflutter/ai-push-testing/main/assets/air_push_update.evc',
      strategy: HotSwapStrategy.immediate,
      onError: (error, stackTrace) {
        debugPrint('HotSwapLoader error: $error');
        return const SizedBox.shrink();
      },
      child: MaterialApp(
        title: 'Air Push',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(title: 'Air Push Home'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HotSwap(
      id: '#air_push_scaffold',
      args: [
        $BuildContext.wrap(context),
        _counter,
        $Function((runtime, target, args) {
          _incrementCounter();
          return null;
        }),
      ],
      childBuilder: (context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: HotSwap(
            id: '#air_push_fab_icon',
            childBuilder: (context) => const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
