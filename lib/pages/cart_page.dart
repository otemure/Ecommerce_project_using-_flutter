import 'package:first_project/pages/home_page.dart';
import 'package:first_project/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:first_project/widgets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CartPage();
  }
}

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
      child: Column(children: [
        Row(children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              'images/Arrow - Left 2.png',
            ),
          ),
          const Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  'My Cart',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
                )),
          ),
        ]),
        const Column(children: [
          CartItem(
            itemAmount: "\$250",
            itemImage: 'images/cart1.png',
            itemName: 'Henley Shirts',
          ),
          CartItem(
            itemAmount: "\$145",
            itemImage: 'images/cart5.png',
            itemName: 'Casual Shirts',
          ),
          CartItem(
            itemAmount: "\$225",
            itemImage: 'images/cart3.png',
            itemName: 'Casual Nolin',
          ),
          CartItem(
            itemAmount: "\$225",
            itemImage: 'images/cart4.png',
            itemName: 'Casual Nolin',
          ),
        ]),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Subtotal:',
                style: TextStyle(fontSize: 20.0),
              ),
              Text(
                '\$740',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF67952),
                  minimumSize: const Size(300, 65),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                child: const Text(
                  'Checkout',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}

