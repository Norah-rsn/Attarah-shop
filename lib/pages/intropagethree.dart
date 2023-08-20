import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPageThree extends StatelessWidget {
  const IntroPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 40, top: 160),
            child: Image.asset(
              "images/delivery.png",
              height: 210,
              width: 210,
            ),
          ),
          Text(
            "توصيل مجاني للمنزل",
            textAlign: TextAlign.center,
            style: GoogleFonts.reemKufi(
                fontSize: 36,
                fontWeight: FontWeight.w300,
                color: Colors.red[900]),
          ),
        ],
      ),
    );
  }
}
