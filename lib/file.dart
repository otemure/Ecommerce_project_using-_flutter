import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:first_project/pages/productdetails_page.dart';
import 'package:first_project/widgets.dart';
import 'package:first_project/pages/cart_page.dart';
import 'package:first_project/pages/profile_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Home> {
  List<dynamic> images = [];
  int selectedIndex = 0;
  List<Widget> widgetList = <Widget>[
    const Cart(),
    const Profile(),
  ];
  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void getApiImages() async{
    print('fetch images called');
    const url = 'https://fakestoreapi.com/products';
    final uri = Uri.parse(url);
    final response = await  http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      images =json['results'];
    });
    print('fetch images completed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            right: false,
            left: false,
            child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'images/sidebar.svg',
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 24.0,
                                color: Colors.black,
                              ),
                              SizedBox(width: 8.0),
                              Text(
                                '15/2 New Texas',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'images/logo.svg',
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          'Explore',
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('best Outfits for you',
                            style: TextStyle(color: Colors.grey, fontSize: 30)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,

                              hintText: 'Search items...',
                              prefixIcon: const Icon(Icons.search),
                              // border: const OutlineInputBorder(
                              //   borderRadius:
                              //       BorderRadius.all(Radius.circular(25.0)),
                              // ),
                              suffixIcon: Container(
                                width: 50,
                                height: 50,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color: const Color(0XFFF67952),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                                  child: SvgPicture.asset(
                                    'images/Filter.svg',
                                    colorFilter: const ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 25.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeItem(
                              itemName: 'dress',
                              itemPicture: ("images/dress.svg"),
                            ),
                            HomeItem(
                              itemName: 'Shirts',
                              itemPicture: ("images/shirt.svg"),
                            ),
                            HomeItem(
                                itemName: 'Pants',
                                itemPicture: 'images/pant.svg'),
                            HomeItem(
                                itemName: 'T-shirt',
                                itemPicture: 'images/tshirt.svg')
                          ],
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Text(
                              "New Arrival",
                              style: TextStyle(
                                  fontSize: 25.0, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Text(
                            "See All",
                            style:
                            TextStyle(fontSize: 15.0, color: Colors.grey),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: const Border.fromBorderSide(
                                    BorderSide(
                                      color:
                                      Colors.white, // Color of the border
                                      width: 10.0,
                                      // Width of the border
                                      style: BorderStyle
                                          .solid, // Border style (solid or none)
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Image.asset(
                                      'images/whiteshirt.png',
                                    ),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$165',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Long Sleeve Shirts',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Container(
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: const Border.fromBorderSide(
                                    BorderSide(
                                      color:
                                      Colors.white, // Color of the border
                                      width: 10.0,
                                      // Width of the border
                                      style: BorderStyle
                                          .solid, // Border style (solid or none)
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const Product()),
                                        );
                                      },
                                      child: Image.asset(
                                        'images/blackshirt.png',
                                      ),
                                    ),
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$275',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    const Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Causal Henley Shirts',
                                          style: TextStyle(fontSize: 12.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ]))),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0XFff67952),
        currentIndex: selectedIndex,
        onTap: onItemTap,
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0XFFf78e6d)),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Buy',
              backgroundColor: Color(0XFFf78e6d)),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Heart',
              backgroundColor: Color(0XFFf78e6d)),
          BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Profile()),
                  );
                },
                child: const Icon(
                  Icons.person,
                ),
              ),
              label: 'Profile',
              backgroundColor: const Color(0XFFf78e6d)),
        ],
      ),
    );
  }
}
