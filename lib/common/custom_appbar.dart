import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/common/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    //  required this.onpress,
  });
  final String title;
  //final Function onpress;

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Container(
        margin: const EdgeInsets.all(10),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: ColorApp().color_green,
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: Center(
          child: IconButton(
              icon: FaIcon(
                FontAwesomeIcons.chevronLeft,
                color: ColorApp().color_white,
                size: 24,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
