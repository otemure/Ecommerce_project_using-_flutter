import 'package:first_project/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:first_project/widgets.dart';
import 'package:first_project/pages/home_page.dart';
import 'productdetails_page.dart';
import 'cart_page.dart';
import 'profile_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'WELCOME',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            SvgContainer(),
          ],
        ),
      )),
    );
  }
}
