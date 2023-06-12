import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/common/color.dart';
import 'package:project/pages/login_page.dart';
import 'package:project/pages/register_page.dart';

class SplashNext extends StatefulWidget {
  const SplashNext({super.key});

  @override
  State<SplashNext> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashNext> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 300),
            const Image(image: AssetImage("assets/images/logo.png")),
            const SizedBox(height: 10),
            Text("Welcome to ",
                style: GoogleFonts.lobster(
                    color: ColorApp().color_white, fontSize: 30)),
            const SizedBox(height: 5),
            Text("Doctor Hunt ",
                style: GoogleFonts.poppins(
                    color: ColorApp().color_black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(height: 1, width: 80, color: ColorApp().color_grey),
                const SizedBox(width: 20),
                Text(
                  "Sign in with ",
                  style: GoogleFonts.lobster(
                      color: ColorApp().color_white, fontSize: 20),
                ),
                const SizedBox(width: 20),
                Container(height: 1, width: 80, color: ColorApp().color_grey),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorApp().color_white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset: const Offset(0, 3))
                          ]),
                      child: ClipOval(
                        child: Image.asset("assets/icons/fb.png"),
                      )),
                  Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorApp().color_white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset: const Offset(0, 3))
                          ]),
                      child: ClipOval(
                        child: Image.asset("assets/icons/apple.png"),
                      )),
                  Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorApp().color_white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset: const Offset(0, 3))
                          ]),
                      child: ClipOval(
                        child: Image.asset("assets/icons/gg.png"),
                      )),
                ],
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Text.rich(
                TextSpan(
                    text: "Already have an account ",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: ColorApp().color_white,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ColorApp().color_white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const RegisterPage()));
              },
              child: Text.rich(
                TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: ColorApp().color_white,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text: 'Create',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: ColorApp().color_white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
