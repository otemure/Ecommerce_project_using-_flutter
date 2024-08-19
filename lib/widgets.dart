import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_project/pages/productdetails_page.dart';

class SvgContainer extends StatelessWidget {
  const SvgContainer({super.key});
  @override
  Widget build(context) {
    return SvgPicture.asset(
      'images/Vector.svg',
      semanticsLabel: 'VECTOR',
      height: 150.0,
      width: 100.0,
    );
  }
}

class Forms extends StatelessWidget {
  const Forms(
      {super.key,
      required this.nameController,
      required this.labelName,
      required this.obscuretext,
      required this.icon});
  final TextEditingController nameController;
  final String labelName;
  final bool obscuretext;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscuretext,
      controller: nameController,
      decoration: InputDecoration(
          labelText: labelName,
          border: const OutlineInputBorder(),
          prefixIcon: icon),
    );
  }
}

class ItemContainer extends StatelessWidget {
  const ItemContainer({
     required this.images,required this.clothName,super.key,
  });
final String clothName;
final String images;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: const Border.fromBorderSide(
                  BorderSide(
                    color:
                    Colors.white, // Color of the border
                    width: 20.0,
                    // Width of the border
                    style: BorderStyle
                        .solid, // Border style (solid or none)
                  ),
                ),
              ),
              child: SvgPicture.asset(
                images,
                height:
                50.0, // You can set the size as needed
                width: 50.0,
              ),
            ),
             Text(clothName)
          ],
        ),
      ],
    );
  }
}

class ProfileRow extends StatelessWidget {
  const ProfileRow({
    super.key, required this.text, required this.rating, required this.image
  });
  final String text;
  final String rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: const Border.fromBorderSide(
          BorderSide(
            color: Colors.white,
            width: 5.0,
            style: BorderStyle.solid,
          ),
        ),

      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            image,
          ),
          Text(
            text, style: const TextStyle(
              fontSize: 12.0
          ),),
          Text(rating, style: const TextStyle(
              fontWeight: FontWeight.w700
          ),),
        ],
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem(
      {required this.itemAmount,
        required this.itemName,
        required this.itemImage,
        super.key});
  final String itemName;
  final String itemAmount;
  final String itemImage;
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int productCounter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0, horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 70,
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color(0XFFf1eded)),
                    child: Image.asset(widget.itemImage),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName,
                    style: const TextStyle(fontSize: 15.0),
                  ),
                  Text(
                    widget.itemAmount,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Color(0xfff2dbc6)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      productCounter++;
                    });
                  },
                  child: const Icon(
                    Icons.add,
                    color: Color(0xffF67952),
                    size: 20.0,
                  ),
                ),
              ),
              Text(productCounter.toString()),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    color: Color(0xfff2dbc6)),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (productCounter > 1) {
                        productCounter--;
                      }
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                    color: Color(0xffF67952),
                    size: 20.0,
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key, required this.info1, required this.info2});
  final String info1;
  final String info2;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25.0, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(info1),
              Text(info2, style: const  TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
        )
      ],
    );
  }
}


class HomeItem extends StatelessWidget {
  const HomeItem(
      {super.key, required this.itemName, required this.itemPicture});
  final String itemPicture;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: const Border.fromBorderSide(
                BorderSide(
                  color: Colors.white,
                  width: 20.0,
                  // Width of the border
                  style: BorderStyle.solid,
                ),
              ),
            ),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Product()),
                  );
                },
                child: SvgPicture.asset(itemPicture)),
          ),
        ),
        Text(itemName)
      ],
    );
  }
}
