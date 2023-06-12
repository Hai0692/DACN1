import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/constants/constants.dart';
import 'package:project/pages/home_page.dart';
import 'package:async/async.dart';



class BookingController extends GetxController {
  final isLoading = false.obs;

  Future booking({
    required String token,
    required id,
    required user_id,
    required File? image,
    required String address,
    required String birthday,
    required String gender,
    required String medicalHistory,
    // required DateTime bookingDate,
    required String bookingTime,
  }) async {
    try {
      var stream = http.ByteStream(DelegatingStream.typed(image!.openRead()));
      var length = await image.length();
      Map<String, String> headers = {
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      };
      var request = http.MultipartRequest('POST', Uri.parse('${url}user/booking/$id'));
      request.headers.addAll(headers);
      request.files.add(http.MultipartFile('avatar', image.readAsBytes().asStream(), image.lengthSync(), filename: image.path.split('/').last));
      request.fields['address'] = address;
      request.fields['birthday'] = birthday;
      request.fields['address'] = address;
      request.fields['gender'] = gender;
      request.fields['medical_history'] = medicalHistory;
      request.fields['user_id'] = user_id.toString();
      request.fields['booking_time'] = bookingTime.toString();
      var response = await request.send();
      if (response.statusCode == 200) {
        Get.offAll(() => const HomePage());
        print("success");
      } else {
        isLoading.value = false;
        response.stream.transform(utf8.decoder).listen((value) {
          print(value);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
