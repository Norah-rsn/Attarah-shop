import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPageTwo extends StatelessWidget {
  const IntroPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 40, top: 160),
            child: Image.asset("images/cooking.png"),
          ),
          Text(
            "أجود أنواع البهارات لطبخة مثالية",
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
