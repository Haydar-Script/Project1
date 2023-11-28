import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static String calculatedTip = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversion Result'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Text(
          'Converted Tip: \$${(double.parse(calculatedTip) * 2).toStringAsFixed(2)}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}