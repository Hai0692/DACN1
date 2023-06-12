import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:project/constants/constants.dart';
import 'package:project/models/doctor.dart';


class DoctorController extends GetxController{

  static List<Doctor> parseDoctor(String responseBody){
    var list = json.decode(responseBody) as List<dynamic>;
    List<Doctor> doctors = list.map((model) => Doctor.fromJson(model)).toList();
    return doctors;
  }
  //get doctor data
  Future<dynamic> getDoctor(String token) async {
    try {
      var doctor = await http.get(
          Uri.parse('${url}user/doctor'),
          headers: {'Authorization': 'Bearer $token'});
      if(doctor.statusCode == 200 && doctor.body !=''){
        return doctor.body;
      }
    }catch (error) {
      return error;
    }
  }
  //get doctor detail
  Future<dynamic> getDoctorDetail(String token,String id,) async {
    try {
      var doctor = await http.get(
          Uri.parse('${url}user/doctor/$id'),
          headers: {'Authorization': 'Bearer $token'});
      if(doctor.statusCode == 200 && doctor.body !=''){
        return doctor.body;
      }
    }catch (error) {
      return error;
    }
  }
}