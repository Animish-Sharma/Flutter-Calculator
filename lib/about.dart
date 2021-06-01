import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "About".toUpperCase(),
          style: GoogleFonts.mateSc(),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: FaIcon(FontAwesomeIcons.home),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey[700]),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Center(
                child: Text(
                  "About The Devloper",
                  style: GoogleFonts.ubuntu(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text(
                  "I am Animish Sharma,the devloper of this calculator.I am 15 and still learning to code. Now I know that this app still lacks in alot of fields but this was my project in flutter"
                  "I hope that you would find this app beautiful.If you find any bug you can contact me on",
                  style: GoogleFonts.notoSans(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            Center(
              child: SelectableText(
                "animish407@gmail.com",
                style: GoogleFonts.rajdhani(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Center(
                child: Text(
                  "Social Media of The Devloper",
                  style: GoogleFonts.zillaSlabHighlight(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.instagram),
                    onPressed: () => _openUrl(
                      context,
                      "https://www.instagram.com/i_am_animish_sharma",
                    ),
                    label: Text(
                      "Instagram",
                      style: GoogleFonts.overpass(
                        fontSize: 18,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent[400],
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.github),
                    onPressed: () => _openUrl(
                      context,
                      "https://www.github.com/Animish-Sharma",
                    ),
                    label: Text(
                      "Github",
                      style: GoogleFonts.overpass(
                        fontSize: 18,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.black,
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    onPressed: () => _openUrl(
                      context,
                      "https://www.twitter.com/IAMANIMISH",
                    ),
                    label: Text(
                      "Twitter",
                      style: GoogleFonts.overpass(
                        fontSize: 18,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue[400],
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    icon: FaIcon(FontAwesomeIcons.reddit),
                    onPressed: () => _openUrl(
                      context,
                      "https://www.reddit.com/u/iamanimish",
                    ),
                    label: Text(
                      "Reddit",
                      style: GoogleFonts.overpass(
                        fontSize: 18,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.red,
                      primary: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _openUrl(BuildContext context, String _link) async {
    await launch(
      _link,
      forceSafariVC: false,
      forceWebView: false,
    );
  }
}
