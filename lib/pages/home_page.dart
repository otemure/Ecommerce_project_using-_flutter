import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:first_project/pages/cart_page.dart';
import 'package:first_project/pages/profile_page.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

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
    const Profile(),
  ];

  @override
  void initState() {
    super.initState();
    getApiImages();
  }

  void onItemTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<void> getApiImages() async {
    const url = 'https://fakestoreapi.com/products';
    final uri = Uri.parse(url);
    {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;
        setState(() {
          images = jsonData;
        });
      } else {}
    }
    {}
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
                    SvgPicture.asset('images/sidebar.svg'),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 24.0,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 8.0),
                        Text(
                          '15/2 New Texas',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset('images/logo.svg'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text('Explore',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.bold),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Best Products for You',
                    style: TextStyle(color: Colors.grey, fontSize: 30),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search items...',
                          prefixIcon: const Icon(Icons.search),
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
                ),
                const SizedBox(height: 20),
                Text(
                  'New Arrivals:',
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w900)),
                ),
                images.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1,
                        ),
                        itemCount: images.length,
                        itemBuilder: (context, index) {
                          final product = images[index];
                          return Column(
                            children: [
                              Image.network(
                                product['image'],
                                height: 100,
                                width: 100,
                              ),
                              Text(
                                product['title'],
                                style: const TextStyle(fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '\$${product['price']}',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
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
          BottomNavigationBarItem(
              icon: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Cart()),
                    );
                  },
                  child: const Icon(Icons.shopping_cart)),
              label: 'Buy',
              backgroundColor: const Color(0XFFf78e6d)),
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
