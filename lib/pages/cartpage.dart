import 'package:ecommercialtwo/model/cartmodel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Consumer<CartModel>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    "مشترياتي",
                    style: GoogleFonts.tajawal(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cartItems.length,
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromARGB(255, 182, 182, 182),
                                  spreadRadius: .5,
                                  blurRadius: .8,
                                )
                              ]),
                          child: ListTile(
                            leading: Image.asset(
                              value.cartItems[index][2],
                              height: 36,
                            ),
                            title: Text(
                              value.cartItems[index][0],
                              style: GoogleFonts.tajawal(
                                  fontSize: 19, fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              value.cartItems[index][1] + ' ريال',
                              style: GoogleFonts.tajawal(
                                  fontSize: 17, fontWeight: FontWeight.w400),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.cancel),
                              onPressed: () =>
                                  Provider.of<CartModel>(context, listen: false)
                                      .removeItemsFromCart(index),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //Total + Pay now
                Padding(
                  padding: const EdgeInsets.all(36.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[900],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "إجمالي السعر",
                              style: GoogleFonts.tajawal(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              '${value.calculateTotal()} ' 'ريال',
                              style: GoogleFonts.tajawal(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red.shade100,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              Text(
                                "إتمام الشراء",
                                style: GoogleFonts.tajawal(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                size: 16,
                                color: Colors.white,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
