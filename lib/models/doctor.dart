class Doctor {
  String? avatar;
  String? specialty;
  String? availability;
  User? user;

  Doctor({this.avatar, this.specialty, this.availability, this.user});

  Doctor.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
    specialty = json['specialty'];
    availability = json['availability'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['avatar'] = this.avatar;
    data['specialty'] = this.specialty;
    data['availability'] = this.availability;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? name;
  int? id;

  User({this.name, this.id});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}