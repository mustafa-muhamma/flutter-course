import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  // const BmiResultScreen({super.key});
  final bool isMale;
  final int result;
  final int weight;

  const BmiResultScreen({
    required this.isMale,
    required this.weight,
    required this.result,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Result")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Geneder:${isMale ? "Male" : "female"}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Result:$result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'Weight:$weight',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
