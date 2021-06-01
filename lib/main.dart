import 'package:calculator/about.dart';
import 'package:calculator/calculator.dart';
import 'package:calculator/history.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

const CalculatorRoute = "/";
const HistoryRoute = "/history";
const AboutRoute = "/about";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.grey[800],
          appBarTheme: AppBarTheme(
              textTheme: TextTheme(
            headline6: _appBarStyle(context),
          ))),
      onGenerateRoute: _routes(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case CalculatorRoute:
          screen = Calculator();
          break;
        case HistoryRoute:
          screen = History();
          break;
        case AboutRoute:
          screen = About();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  _appBarStyle(BuildContext context) {
    return GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w300,
      textStyle: TextStyle(
        letterSpacing: .5,
      ),
    );
  }
}
