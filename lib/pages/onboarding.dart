import 'package:ecommercialtwo/pages/homepage.dart';
import 'package:ecommercialtwo/pages/intropageone.dart';
import 'package:ecommercialtwo/pages/intropagethree.dart';
import 'package:ecommercialtwo/pages/intropagetwo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoarding();
}

class _OnBoarding extends State<OnBoarding> {
  //Controller to keep track of which page we're on
  final PageController _controller = PageController();

  //Keep track of if we in the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroPageOne(),
              IntroPageTwo(),
              IntroPageThree(),
            ],
          ),
          //Do indeicator
          Container(
            alignment: const Alignment(0, 0.8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //Next and Done
                onLastPage
                    ? GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomePage();
                            },
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.red[900],
                              borderRadius: BorderRadius.circular(14)),
                          child: Text(
                            "انتهى",
                            style: GoogleFonts.tajawal(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 70,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.red[900],
                              borderRadius: BorderRadius.circular(14)),
                          child: Text("التالي",
                              style: GoogleFonts.tajawal(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white)),
                        ),
                      ),

                //Indeicator
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey.shade200,
                    activeDotColor: Colors.red.shade200,
                    dotHeight: 8,
                    dotWidth: 12,
                  ),
                ),

                //Skip
                GestureDetector(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  ),
                  child: Text(
                    "تخطي",
                    style: GoogleFonts.tajawal(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
