import 'package:ecommercialtwo/components/gorocyitemstitle.dart';
import 'package:ecommercialtwo/model/cartmodel.dart';
import 'package:ecommercialtwo/pages/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          title: Center(
            child: Text(
              "عطارة أم صالح",
              style: GoogleFonts.tajawal(
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          shape: ShapeBorder.lerp(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            null,
            0,
          ),
        ),

        //Cart button
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CartPage();
              },
            ),
          ),
          backgroundColor: Colors.black,
          child: const Icon(Icons.shopping_bag),
        ),

        //Body
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48,
              ),
              const SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  "لدينا أجود وأصفى أنواع البهار",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.tajawal(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Divider(
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 24,
              ),

              //Items List
              Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      itemCount: value.shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return GoroceryItemsTitles(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addItemsToCart(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
