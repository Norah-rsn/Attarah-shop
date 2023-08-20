import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GoroceryItemsTitles extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  void Function()? onPressed;

  GoroceryItemsTitles(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.3),
                  spreadRadius: 3,
                  blurRadius: 2,
                  offset: const Offset(0, 3),
                )
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
                height: 64,
              ),
              Text(
                itemName,
                style: GoogleFonts.tajawal(
                    fontSize: 19, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '$itemPrice  ' 'ريال',
                    style: GoogleFonts.tajawal(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox.fromSize(
                    size: const Size(53, 53),
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.red[100],
                          highlightColor: Colors.red[50],
                          onTap: onPressed,
                          child: const Icon(
                            Icons.add_shopping_cart,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
