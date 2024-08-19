import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cart_page.dart';
//
// class ProductPage extends StatelessWidget {
//   const ProductPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const ProductPage();
//   }
// }

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'images/Arrow - Left 2.png',
                    ),
                  ),
                  Image.asset('images/Heart2.png'),
                ],
              ),
            ),
            Center(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 38.0),
                  child: SvgPicture.asset(
                    'images/dress.svg',
                    height: screenHeight *
                        0.5, // Set the height to half of the screen height
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text(
                            'Casual Female\n Gown',
                            style: TextStyle(
                                fontSize: 25.0, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Text(
                          '\$175',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                        'A Female gown  is a collarless pullover gowns, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2–5 buttons.'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffF67952),
                        minimumSize: const Size(300, 65),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Cart()),
                        );
                      },
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
