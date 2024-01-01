import 'package:flutter/material.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatelessWidget {
  const MyCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Calculator",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "";
  String _output = "";

  double num1 = 0.0;
  double num2 = 0.0;

  String operand = "";

  Map<String, IconData> iconMap = {
    "+": Icons.add,
    "-": Icons.remove,
    "x": Icons.close,
    "/": Icons.percent
  };

  buttonPressed(String buttonText) {
    if (buttonText == 'CLEAR') {
      _output = "";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already contains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = _output.toString().trim();
      operand = operand;
    });
  }

  Widget buildButton({required String label}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(3),
        height: 80,
        child: OutlinedButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.black),
              backgroundColor: MaterialStateProperty.all(Colors.white10)),
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          onPressed: () => buttonPressed(label),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Calculator"),
          ),
          backgroundColor: Colors.teal[700],
        ),
        backgroundColor: Colors.teal[700],
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 20,
                      alignment: Alignment.bottomLeft,
                      child: Icon(
                        iconMap[operand],
                        color: Colors.teal[900],
                      ),
                    ),
                    Container(
                      width: 252,
                      alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        output,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  height: 10,
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    buildButton(label: "7"),
                    buildButton(label: "8"),
                    buildButton(label: "9"),
                    buildButton(label: "/")
                  ],
                ),
                Row(
                  children: [
                    buildButton(label: "4"),
                    buildButton(label: "5"),
                    buildButton(label: "6"),
                    buildButton(label: "X")
                  ],
                ),
                Row(
                  children: [
                    buildButton(label: "1"),
                    buildButton(label: "2"),
                    buildButton(label: "3"),
                    buildButton(label: "-")
                  ],
                ),
                Row(
                  children: [
                    buildButton(label: "."),
                    buildButton(label: "0"),
                    buildButton(label: "00"),
                    buildButton(label: "+")
                  ],
                ),
                Row(
                  children: [
                    buildButton(label: "CLEAR"),
                    buildButton(label: "=")
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
