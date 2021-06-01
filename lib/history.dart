import 'package:calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'calculator.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AboutRoute);
            },
            icon: FaIcon(FontAwesomeIcons.infoCircle),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.grey[900],
        ),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                "Calculation History",
                style: GoogleFonts.roboto(
                  fontSize: 42,
                  fontWeight: FontWeight.w200,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          ..._body(context),
        ]),
      ),
    );
  }

  _body(BuildContext context) {
    return calcHistory.entries
        .map<Widget>(
          (entry) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
              child: Card(
                elevation: 20,
                shadowColor: Colors.white,
                child: SizedBox(
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 48.0, vertical: 23.0),
                    child: Text(
                      entry.key + " = " + entry.value,
                      style: GoogleFonts.poppins(
                        letterSpacing: .5,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        )
        .toList()
        .reversed;
  }
}
