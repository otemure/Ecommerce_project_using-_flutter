import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});
  @override
  State<Profile> createState() => _CartState();
}

class _CartState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/Rectangle1.png'),
                        fit: BoxFit.fill)),
                child:  Padding(
                  padding: EdgeInsets.only(bottom: 50.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios)),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Text(
                          'Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Icon(Icons.more_vert),
                      SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                  'images/girl2.jpg',
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Maraku ALtina',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0),
            ),
          ),
          const Text(
            'maraku@gmail.com',
            style: TextStyle(color: Colors.grey),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProfileRow(
                  image: ("images/Bag.svg"),
                  rating: ("10+"),
                  text: ("progress order"),
                ),
                ProfileRow(
                    text: 'Promocodes',
                    rating: "5",
                    image: "images/Ticket.svg"),
                ProfileRow(
                  text: "Reviewers",
                  rating: (" 4.5k"),
                  image: ("images/star.svg"),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 200.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          const ProfileInfo(info1: "Name:", info2: "George Otemure"),
          const ProfileInfo(info1: "Email:", info2: "george@gmail.com"),
          const ProfileInfo(info1: "Location:", info2: "san diego"),
          const ProfileInfo(info1: "Zip code:", info2: "1200"),
          const ProfileInfo(
              info1: "Phone Number:", info2: "(+234) 54645 4354 334"),
        ]),
      ),
    );
  }
}
