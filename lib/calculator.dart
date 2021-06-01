import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

final Map<dynamic, dynamic> calcHistory = new Map<dynamic, dynamic>();

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "";
  String result = "0";

  Color buttonColor = Color(0xff424242);
  Color operatorColor = Color(0xff546E7A);

  _buttonTap(String number) {
    equation += number;
    setState(() {});
  }

  _removeLast() {
    if (equation.length != 0) {
      equation = equation.substring(0, equation.length - 1);
      setState(() {});
    }
  }

  _equal() {
    try {
      Parser p = Parser();
      equation = equation.replaceAll("÷", "/");
      equation = equation.replaceAll("×", "*");
      Expression ex = p.parse(equation);
      ContextModel cm = ContextModel();
      dynamic val = ex.evaluate(EvaluationType.REAL, cm);
      result = val.toString();
      equation = equation.replaceAll("/", "÷");
      equation = equation.replaceAll("*", "×");
      calcHistory[equation] = result;
      print(calcHistory);
      equation = "";
      setState(() {});
    } catch (e) {
      result = "Invalid calculation";
      setState(() {});
    }
  }

  _clear() {
    equation = "";
    result = "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
        brightness: Brightness.light,
        leading: IconButton(
          icon: Icon(Icons.info_outline_rounded),
          onPressed: () {
            Navigator.pushNamed(context, AboutRoute);
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HistoryRoute);
            },
            icon: Icon(Icons.history),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Colors.grey[900],
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 25.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    equation,
                    style: GoogleFonts.poppins(
                      fontSize: equation.length > 15
                          ? equation.length > 23
                              ? 20
                              : 25
                          : 32,
                      backgroundColor: Colors.grey[900],
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25.0, horizontal: 9.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    result,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: (result != "Invalid calculation" &&
                              result.length < 10)
                          ? 55
                          : 32,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _button(context, buttonColor, "7", () => _buttonTap("7"),
                      Colors.white),
                  _button(context, buttonColor, "8", () => _buttonTap("8"),
                      Colors.white),
                  _button(context, buttonColor, "9", () => _buttonTap("9"),
                      Colors.white),
                  _button(context, operatorColor, "×", () => _buttonTap("×"),
                      Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _button(context, buttonColor, "4", () => _buttonTap("4"),
                      Colors.white),
                  _button(context, buttonColor, "5", () => _buttonTap("5"),
                      Colors.white),
                  _button(context, buttonColor, "6", () => _buttonTap("6"),
                      Colors.white),
                  _button(context, operatorColor, "—", () => _buttonTap("-"),
                      Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _button(context, buttonColor, "1", () => _buttonTap("1"),
                      Colors.white),
                  _button(context, buttonColor, "2", () => _buttonTap("2"),
                      Colors.white),
                  _button(context, buttonColor, "3", () => _buttonTap("3"),
                      Colors.white),
                  _button(context, operatorColor, "+", () => _buttonTap("+"),
                      Colors.white),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _button(context, Colors.red, " X ", () => _removeLast(),
                      Colors.white),
                  _button(context, buttonColor, ".", () => _buttonTap("."),
                      Colors.white),
                  _button(context, buttonColor, "0", () => _buttonTap("0"),
                      Colors.white),
                  _button(context, operatorColor, "÷", () => _buttonTap("÷"),
                      Colors.white),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () => _clear(),
                      child: Center(
                        child: Text(
                          "C",
                          style: GoogleFonts.raleway(fontSize: 36),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.red[500],
                        padding: const EdgeInsets.symmetric(
                          vertical: 12.0,
                          horizontal: 32.0,
                        ),
                        minimumSize: Size(50, 30),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => _equal(),
                      child: Center(
                        child: Text("=",
                            style: TextStyle(
                              fontSize: 36,
                            )),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.green[500],
                        padding: const EdgeInsets.all(12.0),
                        minimumSize: Size(180, 30),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _button(BuildContext context, Color backgroundColor, String text,
      VoidCallback onPressed, Color color) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Center(
        child: Text(text,
            style: TextStyle(
              color: color,
              fontSize: text == "+" || text == "÷" || text == "×" ? 55 : 35,
            )),
      ),
      style: ElevatedButton.styleFrom(
          onPrimary: color,
          shape: CircleBorder(),
          primary: backgroundColor,
          minimumSize: Size(95, 110),
          elevation: 40,
          textStyle: GoogleFonts.raleway()),
    );
  }
}
