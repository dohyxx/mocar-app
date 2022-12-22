import 'parents/model.dart';

class Vehicle extends Model {
  int vehicleId;                //차량 일련번호
  int shipCompId;               //배송 업체 일련번호
  int shipDriverId;             //배송 기사 일련번호
  int vehicleTypeCd;            //차량 유형 코드
  String vehicleNo;             //차량 번호
  String vehicleLicenseUrl;     //차량등록증 이미지 URL
  String directMgmtYn;          //직영 차량 여부
  String vehicleOwnerCd;        //차량 소유 코드
  String dropLocId;             //출발 하차지 아이디
  String useYn;                 //운행 가능 여부
  String gisLat;                //위도
  String gisLon;                //경도
  String createdAt;             //등록일시
  int createdUser;              //등록자
  String updatedAt;             //수정일시
  int updatedUser;              //수정자

  Vehicle({this.vehicleId, this.shipCompId, this.shipDriverId, this.vehicleTypeCd, this.vehicleNo, this.vehicleLicenseUrl, this.directMgmtYn,
    this.vehicleOwnerCd, this.dropLocId, this.useYn, this.gisLat, this.gisLon, this.createdAt,
    this.createdUser, this.updatedAt, this.updatedUser});

  Vehicle.fromJson(Map<String, dynamic> json) {
    vehicleId = intFromJson(json, 'id');
    shipCompId = intFromJson(json, 'ship_comp_id');
    shipDriverId = intFromJson(json, 'ship_driver_id');
    vehicleTypeCd = intFromJson(json, 'vehicle_type_cd');
    vehicleNo = stringFromJson(json, 'vehicle_no');
    vehicleLicenseUrl = stringFromJson(json, 'vehicle_license_url');
    directMgmtYn = stringFromJson(json, 'direct_mgmt_yn');
    vehicleOwnerCd = stringFromJson(json, 'vehicle_owner_cd');
    dropLocId = stringFromJson(json, 'drop_loc_id');
    useYn = stringFromJson(json, 'use_yn');
    gisLat = stringFromJson(json, 'gis_lat');
    gisLon = stringFromJson(json, 'gis_lon');
    createdAt = stringFromJson(json, 'created_at');
    createdUser = intFromJson(json, 'created_user');
    updatedAt = stringFromJson(json, 'updated_at');
    updatedUser = intFromJson(json, 'updated_user');

    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.vehicleId;
    data['ship_comp_id'] = this.shipCompId;
    data['ship_driver_id'] = this.shipDriverId;
    data['vehicle_type_cd'] = this.vehicleTypeCd;
    data['vehicle_no'] = this.vehicleNo;
    data['vehicle_license_url'] = this.vehicleLicenseUrl;
    data['direct_mgmt_yn'] = this.directMgmtYn;
    data['vehicle_owner_cd'] = this.vehicleOwnerCd;
    data['drop_loc_id'] = this.dropLocId;
    data['use_yn'] = this.useYn;
    data['gis_lat'] = this.gisLat;
    data['gis_lon'] = this.gisLon;
    data['created_at'] = this.createdAt;
    data['created_user'] = this.createdUser;
    data['updated_at'] = this.updatedAt;
    data['updated_user'] = this.updatedUser;

    return data;
  }
}
