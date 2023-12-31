import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  buttonPressed(String buttonText) {
    if (buttonText == 'Clear') {}
    return true;
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
          backgroundColor: Colors.teal,
        ),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "result",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
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
