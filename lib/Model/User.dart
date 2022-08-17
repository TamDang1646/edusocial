import 'Address.dart';

class User {
  int? id;
  String? code;
  String? phone;
  String? email;
  String? userName;
  String? avatar;
  int? gender;
  String? birthday;
  Addresses? addresses;

  User(
      {this.id,
      this.code,
      this.phone,
      this.email,
      this.userName,
      this.avatar,
      this.gender,
      this.birthday,
      this.addresses});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    phone = json['phone'];
    email = json['email'];
    userName = json['userName'];
    avatar = json['avatar'];
    gender = json['gender'];
    birthday = json['birthday'];
    addresses = json['addresses'] != null ? Addresses.fromJson(json['addresses']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.toJson();
    }
    return data;
  }
}
