import 'package:first_app/btn_classes.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    final Screensize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(16),
                child: const Text(
                  "0",
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
          ),
          Wrap(
            children: Btn.buttonValues
                .map(
                  (value) => SizedBox(
                    width: value == Btn.n0
                        ? (Screensize.width / 2)
                        : (Screensize.width / 4),
                    height: Screensize.width / 4.5,
                    child: buildButton(value),
                  ),
                )
                .toList(),
          ),
        ]),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        color: getBtnColour(value),
        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white24,
            ),
            borderRadius: BorderRadius.circular(100)),
        child: InkWell(
          onTap: () {},
          child: Center(
              child: Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )),
        ),
      ),
    );
  }
}

Color getBtnColour(value) {
  return [Btn.del, Btn.clr].contains(value)
      ? Colors.blueGrey
      : [
          Btn.per,
          Btn.multiply,
          Btn.add,
          Btn.subtract,
          Btn.divide,
          Btn.calculate,
        ].contains(value)
          ? Colors.orange
          : Colors.black87;
}
