import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/controllers/authentication.dart';
import 'package:project/pages/home_page.dart';

import '../common/color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Stack(children: [
              Container(
                height: 230,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_app.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg_center.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 100),
                  height: 130,
                  width: 130,
                  child: ClipOval(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorApp().color_white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        )
                      ]),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 230),
                  child: Text(
                    'Register',
                    style: GoogleFonts.lobster(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ]),
            Stack(
              children: [
                Form(
                  child: Column(
                    children: [
                      Container(
                        width: 350,
                        height: 60,
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: ColorApp().color_white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextFormField(
                            controller: _nameController,
                            style: TextStyle(color: ColorApp().color_grey),
                            decoration: InputDecoration(
                              icon: FaIcon(
                                FontAwesomeIcons.user,
                                color: ColorApp().color_grey,
                                size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'User Name',
                              hintStyle: GoogleFonts.poppins(
                                color: ColorApp().color_grey,
                                fontSize: 16,
                              ),
                            ),
                            keyboardType: TextInputType.name,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 350,
                        height: 60,
                        padding:
                            EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: ColorApp().color_white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextFormField(
                            controller: _emailController,
                            style: TextStyle(color: ColorApp().color_grey),
                            decoration: InputDecoration(
                              icon: FaIcon(
                                FontAwesomeIcons.envelope,
                                color: ColorApp().color_grey,
                                size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Email Address',
                              hintStyle: GoogleFonts.poppins(
                                color: ColorApp().color_grey,
                                fontSize: 16,
                              ),
                            ),
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                      .hasMatch(val)) {
                                return "Enter a valid email address";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 350,
                        height: 60,
                        padding:
                            EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: ColorApp().color_white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextFormField(
                            controller: _passwordController,
                            style: TextStyle(color: ColorApp().color_grey),
                            decoration: InputDecoration(
                              icon: FaIcon(
                                FontAwesomeIcons.lock,
                                color: ColorApp().color_grey,
                                size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: GoogleFonts.poppins(
                                color: ColorApp().color_grey,
                                fontSize: 16,
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please enter your password";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        width: 350,
                        height: 60,
                        padding:
                            EdgeInsets.symmetric(horizontal: 7.0, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.0),
                          color: ColorApp().color_white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 7,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: TextFormField(
                            controller: _phoneController,
                            style: TextStyle(color: ColorApp().color_grey),
                            decoration: InputDecoration(
                              icon: FaIcon(
                                FontAwesomeIcons.phone,
                                color: ColorApp().color_grey,
                                size: 20,
                              ),
                              border: InputBorder.none,
                              hintText: 'phone number',
                              hintStyle: GoogleFonts.poppins(
                                color: ColorApp().color_grey,
                                fontSize: 16,
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              if (!(val!.isEmpty) &&
                                  !RegExp(r"^(\d+)*$").hasMatch(val)) {
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 220),
                        child: Row(
                          children: [
                            Text(
                              'Create',
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Obx(() {
                              return _authenticationController.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : ElevatedButton(
                                      onPressed: () async {
                                        await _authenticationController
                                            .register(
                                          name: _nameController.text.trim(),
                                          email: _emailController.text.trim(),
                                          password:
                                              _passwordController.text.trim(),
                                          phone: _phoneController.text.trim(),
                                        );
                                      },
                                      child:
                                          Image.asset('assets/icons/arrow.png'),

                                      // } {
                                      //   Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (context) => HomePage()),
                                      //   );
                                      // },
                                      style: ElevatedButton.styleFrom(
                                          shape: StadiumBorder(),
                                          backgroundColor: HexColor("#0EBE7E")),
                                    );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 240),
                  child: Row(
                    children: [
                      Image.asset("assets/images/bottom_app.png"),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Text(
                              "Or creater account with social media",
                              style: TextStyle(color: HexColor("#7E6D6D")),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 45,
                                  width: 45,
                                  child: ClipOval(
                                    child: Image.asset("assets/icons/fb.png"),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorApp().color_white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 7,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 45,
                                  width: 45,
                                  child: ClipOval(
                                    child:
                                        Image.asset("assets/icons/apple.png"),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorApp().color_white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 7,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10),
                                  height: 45,
                                  width: 45,
                                  child: ClipOval(
                                    child: Image.asset("assets/icons/gg.png"),
                                  ),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorApp().color_white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 7,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
