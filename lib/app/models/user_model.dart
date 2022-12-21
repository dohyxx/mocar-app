import 'parents/model.dart';

class User extends Model {

  int user_sn;              //유저 일련번호
  int shipCompId;           //배송 업체 아이디
  String driverNm;          //기사명
  int termsAgreeId;         //약관동의 일련번호
  String email;             //이메일
  String phoneNumber;       //휴대폰 번호
  String phoneOsTypeCd;     //휴대폰 플랫폼 유형 코드
  String phoneUuid;         //휴대폰 UUID
  String talkUserId;        //채널톡 유저 아이디
  bool emailYn;             //메일 정보수신 여부
  bool smsYn;               //문자 정보수신 여부
  bool compCustomerYn;      //기업고객 여부
  String address;           //주소
  String addressDetail;     //상세 주소
  String zipCode;           //우편 번호
  String memo;              //메모
  String createDate;        //생성일
  String crtUserSn;         //등록자

  String truckNumber;       //차량번호
  String password;          //비밀번호
  int vehicleSn;            //차량 일련번호

  bool auth;                //권한 여부
  bool firstAuth = true;    //최초인증여부
  String jwtToken;          //JWT 토큰



  User({this.user_sn, this.shipCompId, this.termsAgreeId, this.email,this.phoneNumber, this.truckNumber, this.password,
      this.driverNm, this.phoneOsTypeCd, this.phoneUuid, this.talkUserId, this.address, this.jwtToken, this.emailYn,
      this.smsYn, this.compCustomerYn, this.addressDetail, this.zipCode, this.memo, this.createDate, this.crtUserSn
  });

  User.fromJson(Map<String, dynamic> json) {
    user_sn = intFromJson(json, 'id');
    shipCompId = intFromJson(json, 'ship_comp_id');
    termsAgreeId = intFromJson(json, 'terms_agree_id');
    driverNm = stringFromJson(json, 'driver_nm');
    phoneOsTypeCd = stringFromJson(json, 'phone_os_type_cd');
    phoneUuid = stringFromJson(json, 'phone_uuid');
    talkUserId = stringFromJson(json, 'ctalk_user_id');
    email = stringFromJson(json, 'email');
    phoneNumber = stringFromJson(json, 'phone_no');
    createDate = stringFromJson(json, 'created_at');
    emailYn = boolFromJson(json, 'info_email_recv_yn');
    smsYn = boolFromJson(json, 'info_sms_recv_yn');
    compCustomerYn = boolFromJson(json, 'comp_cust_yn');
    address = stringFromJson(json, 'addr');
    addressDetail = stringFromJson(json, 'addr_detl');
    zipCode = stringFromJson(json, 'zip_cd');
    memo = stringFromJson(json, 'memo');
    crtUserSn = stringFromJson(json, 'created_user');
    password = stringFromJson(json, 'password');

    vehicleSn = intFromJson(json, 'vehicleSn');
    auth = boolFromJson(json, 'auth');
    jwtToken = stringFromJson(json, 'jwt_token');


    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['user_sn'] = this.user_sn;
    data['ship_comp_id'] = this.termsAgreeId;
    data['terms_agree_id'] = this.termsAgreeId;
    data['driver_nm'] = this.driverNm;
    data['phone_os_type_cd'] = this.phoneOsTypeCd;
    data['phone_uuid'] = this.phoneUuid;
    data['ctalk_user_id'] = this.talkUserId;
    data['email'] = this.email;
    data['phone_no'] = this.phoneNumber;
    data['created_at'] = this.createDate;
    data['info_email_recv_yn'] = this.emailYn;
    data['info_sms_recv_yn'] = this.smsYn;
    data['comp_cust_yn'] = this.compCustomerYn;
    data['addr'] = this.address;
    data['addr_detl'] = this.addressDetail;
    data['zip_cd'] = this.zipCode;
    data['memo'] = this.memo;
    data['created_user'] = this.crtUserSn;
    data['password'] = this.password;

    data['vehicle_id'] = this.vehicleSn;
    data['auth'] = this.auth;
    data['jwt_token'] = this.jwtToken;

    return data;
  }


  // @override
  // bool operator ==(Object other) =>
  //     super == other &&
  //         other is User &&
  //         runtimeType == other.runtimeType &&
  //         email == other.email &&
  //         phoneNumber == other.phoneNumber &&
  //         address == other.address &&
  //         auth == other.auth;
  //
  // @override
  // int get hashCode =>
  //     super.hashCode ^
  //     email.hashCode ^
  //     phoneNumber.hashCode ^
  //     address.hashCode ^
  //     auth.hashCode;
}
