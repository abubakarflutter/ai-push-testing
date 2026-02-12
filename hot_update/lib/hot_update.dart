import 'package:eval_annotation/eval_annotation.dart';
import 'package:flutter/material.dart';

@RuntimeOverride('#air_push_scaffold')
Widget airPushScaffoldUpdate(
    BuildContext context, int counter, Function increment) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.indigo,
      title: const Text('Air Push - Updated!'),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Counter New value (updated via air push):',
          ),
          Text(
            '$counter',
            style: const TextStyle(
              fontSize: 96,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        increment();
      },
      backgroundColor: Colors.indigo,
      child: const Icon(Icons.add, color: Colors.white,),
    ),
  );
}
