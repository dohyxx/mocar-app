import 'parents/model.dart';

class Comp extends Model {
  int compId;
  String compNm;
  String compLogoImg;
  String ownerNm;
  String phoneNo;
  String telNo;
  String faxNo;
  String addr;
  String addrDetl;
  String zipCd;
  String roadAddr;
  String roadAddrDetl;
  String roadZipCd;
  String bizNo;
  String bizLicenseUrl;
  String corpNo;
  bool contractYn;
  bool afterPayYn;
  String taxBillEmail;
  String createdAt;
  int createdUser;
  String updatedAt;
  int updatedUser;



  Comp({this.compId, this.compNm, this.compLogoImg, this.ownerNm, this.phoneNo, this.telNo, this.faxNo,
    this.addr, this.addrDetl, this.zipCd, this.roadAddr, this.roadAddrDetl, this.roadZipCd,
    this.bizNo, this.bizLicenseUrl, this.corpNo, this.contractYn, this.afterPayYn, this.taxBillEmail, this.createdAt, this.createdUser
    , this.updatedAt, this.updatedUser});

  Comp.fromJson(Map<String, dynamic> json) {
    compId = intFromJson(json, 'id');
    compNm = stringFromJson(json, 'comp_nm');
    compLogoImg = stringFromJson(json, 'comp_logo_img');
    ownerNm = stringFromJson(json, 'owner_nm');
    phoneNo = stringFromJson(json, 'phone_no');
    telNo = stringFromJson(json, 'telno');
    faxNo = stringFromJson(json, 'faxno');
    addr = stringFromJson(json, 'addr');
    addrDetl = stringFromJson(json, 'addr_detl');
    zipCd = stringFromJson(json, 'zip_cd');
    roadAddr = stringFromJson(json, 'road_addr');
    roadAddrDetl = stringFromJson(json, 'road_addr_detl');
    roadZipCd = stringFromJson(json, 'road_zip_cd');
    bizNo = stringFromJson(json, 'biz_no');
    bizLicenseUrl = stringFromJson(json, 'biz_license_url');
    corpNo = stringFromJson(json, 'corp_no');
    contractYn = boolFromJson(json, 'contract_yn');
    afterPayYn = boolFromJson(json, 'after_pay_yn');
    taxBillEmail = stringFromJson(json, 'tax_bill_email');
    createdAt = stringFromJson(json, 'created_at');
    createdUser = intFromJson(json, 'created_user');
    updatedAt = stringFromJson(json, 'updated_at');
    updatedUser = intFromJson(json, 'updated_user');

    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.compId;
    data['comp_nm'] = this.compNm;
    data['comp_logo_img'] = this.compLogoImg;
    data['owner_nm'] = this.ownerNm;
    data['phone_no'] = this.phoneNo;
    data['telno'] = this.telNo;
    data['faxno'] = this.faxNo;
    data['addr'] = this.addr;
    data['addr_detl'] = this.addrDetl;
    data['zip_cd'] = this.zipCd;
    data['road_addr'] = this.roadAddr;
    data['road_addr_detl'] = this.roadAddrDetl;
    data['road_zip_cd'] = this.roadZipCd;
    data['biz_no'] = this.bizNo;
    data['biz_license_url'] = this.bizLicenseUrl;
    data['corp_no'] = this.corpNo;
    data['contract_yn'] = this.contractYn;
    data['after_pay_yn'] = this.afterPayYn;
    data['tax_bill_email'] = this.taxBillEmail;
    data['created_at'] = this.createdAt;
    data['created_user'] = this.createdUser;
    data['updated_at'] = this.updatedAt;
    data['updated_user'] = this.updatedUser;

    return data;
  }
}
