import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project/common/color.dart';

import '../common/bottom_bar.dart';
import '../common/custom_appbar.dart';
import 'package:image_picker/image_picker.dart';

class DoctorRequest extends StatefulWidget {
  const DoctorRequest({super.key});

  @override
  State<DoctorRequest> createState() => _DoctorRequestState();
}

class _DoctorRequestState extends State<DoctorRequest> {
  PickedFile? _imageFile;

  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Doctor Request"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            imageProfile(),
            Column(
              children: const [
                AddInfor(label: "Address", hint: "56 Huynh Van Nghe"),
                AddInfor(label: "Education", hint: "Harvard University"),
                AddInfor(label: "Specialty", hint: "Chardiologist"),
                AddInfor(label: "Work experience", hint: "10 year"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //  imageUploadCV(),
                Container(
                  //margin: const EdgeInsets.only(top: 10),
                  width: 110,
                  height: 130,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorApp().color_green.withAlpha(70),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 20),
                          blurRadius: 30,
                          color: ColorApp().color_green.withOpacity(0.3))
                    ],
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.plus,
                          color: ColorApp().color_green,
                          size: 40,
                        ),
                        Text(
                          " Upload CV",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ColorApp().color_green,
                          ),
                        )
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: HexColor("#0EBE7F")),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(children: <Widget>[
        CircleAvatar(
          radius: 70.0,
          backgroundImage: _imageFile == null
              ? const AssetImage("assets/images/doctor.png") as ImageProvider : FileImage(File(_imageFile!.path)),
        ),
        Positioned(
          bottom: 20.0,
          right: 20.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: const Icon(
              Icons.camera_alt,
              color: Colors.teal,
              size: 28.0,
            ),
          ),
        ),
      ]),
    );
  }


  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: GoogleFonts.poppins(
                fontSize: 20,
                color: ColorApp().color_grey,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera, size: 20, color: ColorApp().color_grey),
              onPressed: () {
                takePhoto(
                  ImageSource.camera,
                );
              },
              label: Text("Camera",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: ColorApp().color_green,
                      fontWeight: FontWeight.w500)),
            ),
            TextButton.icon(
              icon: Icon(Icons.image, size: 20, color: ColorApp().color_grey),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery",
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: ColorApp().color_green,
                      fontWeight: FontWeight.w500)),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}

class AddInfor extends StatelessWidget {
  const AddInfor({
    super.key,
    required this.label,
    required this.hint,
  });
  final String label;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: TextFormField(
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(top: 13),
              child: FaIcon(
                FontAwesomeIcons.pen,
                color: ColorApp().color_grey,
                size: 18,
              ),
            ),
            labelText: label,
            labelStyle: GoogleFonts.poppins(
              color: ColorApp().color_green,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
              color: ColorApp().color_black,
              fontSize: 16,
            ),
          ),
          keyboardType: TextInputType.text),
    );
  }
}
