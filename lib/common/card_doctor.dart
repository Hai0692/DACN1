import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/common/color.dart';

class CardDoctor extends StatelessWidget {
  const CardDoctor({
    super.key,
    required this.nameDoctor,
    required this.specialized,
    required this.image, 
    this.press,
  });

  final String nameDoctor;
  final String specialized;
  final String image;
  final void Function()? press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(left: 15),
        width: 150,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              child: Image.network(
                image,
                fit: BoxFit.contain,
                width: 150,
                height: 120,
              ),
            ),
            // Image.asset(image),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorApp().color_white,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 20,
                        color: Colors.green.withOpacity(0.2))
                  ]),
              child: Column(children: [
                Text(
                  nameDoctor,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Doctor $specialized",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.red, size: 15),
                    Icon(Icons.star, color: Colors.red, size: 15),
                    Icon(Icons.star, color: Colors.red, size: 15),
                    Icon(Icons.star, color: Colors.red, size: 15),
                    Icon(Icons.star, color: Colors.grey, size: 15),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
