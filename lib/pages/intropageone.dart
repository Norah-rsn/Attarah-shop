import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPageOne extends StatelessWidget {
  const IntroPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, right: 35),
      child: Row(
        children: [
          Text(
            "عطارة أم صالح ",
            textAlign: TextAlign.center,
            style: GoogleFonts.reemKufi(
                fontSize: 50,
                fontWeight: FontWeight.w300,
                color: Colors.red[900]),
          ),
          Image.asset(
            "images/chilli.png",
            height: 50,
            width: 50,
          ),
        ],
      ),
    );
  }
}
