import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Resultpage.dart';

void main() {
  runApp(TipCalculatorApp());
}

class TipCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      debugShowCheckedModeBanner: false,
      home: TipCalculatorScreen(),
    );
  }
}

class TipCalculatorScreen extends StatefulWidget {
  @override
  _TipCalculatorScreenState createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  TextEditingController billAmountController = TextEditingController();
  double tipPercentage = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children:[
            SizedBox(width: 350,height: 50,
              child: TextField(
                controller: billAmountController,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d{0,9}\.?\d{0,4}')),],
                keyboardType: const TextInputType.numberWithOptions(decimal: true),style: const TextStyle(fontSize: 10),
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Only Numbers are allowed'
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('Tip Percentage: ${tipPercentage.toStringAsFixed(0)}%'),
            Slider(
              value: tipPercentage,
              min: 0,
              max: 30,
              divisions: 30,
              onChanged: (value) {
                setState(() {
                  tipPercentage = value;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateTip();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(),
                  ),
                );
              },
              child: const Text('Convert'),
            ),
          ],
        ),
      ),
    );
  }

  void calculateTip() {
    String inputText = billAmountController.text;
    double billAmount;
    try {
      billAmount = double.parse(inputText);
    } catch (e) {
      billAmount = 0.0;
    }
    double tipAmount = billAmount * (tipPercentage / 100);
    ResultPage.calculatedTip = tipAmount.toStringAsFixed(2);
  }
}


