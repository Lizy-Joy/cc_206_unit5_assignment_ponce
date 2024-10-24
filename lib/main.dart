import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int sum = 0;
  int difference = 0;
  int product = 0;
  int quotient = 0;
  int firstAddNum = 0;
  int secondAddNum = 0;

  // TextEditingControllers to manage input
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5: Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Addition 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $sum'),
              // IconButton for addition
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    sum = firstAddNum + secondAddNum;
                  });
                },
              ),
              
            ],
          ),

          // Subtract 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $difference'),
              // IconButton for subtraction
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    difference = firstAddNum - secondAddNum;
                  });
                },
              ),
             
            ],
          ),

          // Multiplication 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" * "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $product'),
              // IconButton for multiplication
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    product = firstAddNum * secondAddNum;
                  });
                },
              ),
              
            ],
          ),

          // Division 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              const Text(" / "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.tryParse(value) ?? 0;
                    });
                  },
                ),
              ),
              Text(' = $quotient'),
              // IconButton for division
              IconButton(
                icon: const Icon(Icons.horizontal_rule),
                onPressed: () {
                  setState(() {
                    quotient = secondAddNum != 0 ? firstAddNum ~/ secondAddNum : 0;
                  });
                },
              ),
              
            ],
          ),
          // Clear Button
              TextButton(
                onPressed: () {
                  setState(() {
                    // Clear the TextFields and reset 
                    add1Controller.clear();
                    add2Controller.clear();
                    firstAddNum = 0;
                    secondAddNum = 0;
                    sum = 0;
                    difference = 0;
                    product = 0;
                    quotient = 0;
                  });
                },
                child: const Text("Clear"),
              ),
        ],
      ),
    );
  }
}
