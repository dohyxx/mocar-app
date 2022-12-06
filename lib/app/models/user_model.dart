import 'parents/model.dart';

class User extends Model {

  int user_sn;
  String email;
  String password;
  String driverNm;
  String carNumber;
  String apiToken;
  String deviceToken;
  String phoneNumber;
  bool verifiedPhone;
  String address;
  String jwtToken;
  DateTime createDate;

  double latitude;
  double longitude;



  User({this.user_sn, this.email, this.password, this.apiToken, this.deviceToken, this.phoneNumber,
      this.driverNm, this.verifiedPhone, this.address, this.jwtToken, this.carNumber});

  User.fromJson(Map<String, dynamic> json) {
    user_sn = intFromJson(json, 'user_sn');
    email = stringFromJson(json, 'email');
    apiToken = stringFromJson(json, 'api_token');
    deviceToken = stringFromJson(json, 'device_token');
    carNumber = stringFromJson(json, 'carNumber');
    phoneNumber = stringFromJson(json, 'phone_number');
    verifiedPhone = boolFromJson(json, 'phone_verified_at');
    createDate = dateFromJson(json, 'crt_dt');
    driverNm = stringFromJson(json, 'driver_nm');

    jwtToken = stringFromJson(json, 'jwt_token');

    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_sn'] = this.user_sn;
    data['email'] = this.email;
    data['driver_nm'] = this.driverNm;
    data['api_token'] = this.apiToken;
    data["phone_number"] = phoneNumber;
    data["address"] = address;
    data['jwt_token'] = this.jwtToken;
    data['crt_dt'] = this.createDate;

    return data;
  }
}
