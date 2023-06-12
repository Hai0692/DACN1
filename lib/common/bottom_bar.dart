import 'package:flutter/material.dart';
import 'package:project/common/color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project/pages/home_page.dart';

import '../pages/myappoinment.dart';
import '../pages/profile_user.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(10),
      // ignore: prefer_const_constructors
      padding: EdgeInsets.only(left: 20, right: 20),
      height: size.width * .155,
      decoration: BoxDecoration(
        color: ColorApp().color_green,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 30,
              color: ColorApp().color_green.withOpacity(0.15))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
                color: ColorApp().color_white,
                borderRadius: const BorderRadius.all(Radius.circular(100))),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              icon: FaIcon(
                FontAwesomeIcons.house,
                color: ColorApp().color_green,
                size: 20,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.solidHeart,
              color: ColorApp().color_white,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.plus,
              color: ColorApp().color_white,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyAppoinment(),
                ),
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.solidBell,
              color: ColorApp().color_white,
              size: 22,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileUser(),
                ),
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.solidUser,
              color: ColorApp().color_white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
