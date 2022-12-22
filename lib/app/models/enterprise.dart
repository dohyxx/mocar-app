import 'parents/model.dart';

class Enterprise extends Model {
  int compId;             //업체 일련번호
  String compNm;          //업체 이름
  String compLogoImg;     //회사 로고 이미지
  String ownerNm;         //대표자 이름
  String phoneNo;         //휴대폰 번호
  String telNo;           //전화번호
  String faxNo;           //팩스 번호
  String addr;            //주소
  String addrDetail;      //상세주소
  String zipCd;           //우편번호
  String roadAddr;        //도로명 주소
  String roadAddrDetail;  //도로명 상세주소
  String roadZipCd;       //도로명 우편번호
  String bizNo;           //사업자번호
  String bizLicenseUrl;   //사업자등록증 이미지 URL
  String corpNo;          //법인번호
  bool contractYn;        //계약관계 여부
  bool afterPayYn;        //후불 가능 여부
  String taxBillEmail;    //세금계산서 발신 이메일
  String createdAt;       //등록일시
  int createdUser;        //등록자
  String updatedAt;       //수정일시
  int updatedUser;        //수정자


  Enterprise({this.compId, this.compNm, this.compLogoImg, this.ownerNm, this.phoneNo, this.telNo, this.faxNo,
    this.addr, this.addrDetail, this.zipCd, this.roadAddr, this.roadAddrDetail, this.roadZipCd,
    this.bizNo, this.bizLicenseUrl, this.corpNo, this.contractYn, this.afterPayYn, this.taxBillEmail, this.createdAt, this.createdUser
    , this.updatedAt, this.updatedUser});


  Enterprise.fromJson(Map<String, dynamic> json) {
    compId = intFromJson(json, 'id');
    compNm = stringFromJson(json, 'comp_nm');
    compLogoImg = stringFromJson(json, 'comp_logo_img');
    ownerNm = stringFromJson(json, 'owner_nm');
    phoneNo = stringFromJson(json, 'phone_no');
    telNo = stringFromJson(json, 'telno');
    faxNo = stringFromJson(json, 'faxno');
    addr = stringFromJson(json, 'addr');
    addrDetail = stringFromJson(json, 'addr_detl');
    zipCd = stringFromJson(json, 'zip_cd');
    roadAddr = stringFromJson(json, 'road_addr');
    roadAddrDetail = stringFromJson(json, 'road_addr_detl');
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
    data['addr_detl'] = this.addrDetail;
    data['zip_cd'] = this.zipCd;
    data['road_addr'] = this.roadAddr;
    data['road_addr_detl'] = this.roadAddrDetail;
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
