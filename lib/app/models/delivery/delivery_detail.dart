import 'dart:io';

import 'package:mocar_test/app/models/enum.dart';

import '../parents/model.dart';

class DeliveryDetail extends Model {

  int routeId;                //경로 일련번호
  int pickLocationId;         //상차지 일련번호
  int dropLocationId;         //하차지 일련번호
  int nodeSeq;                //경로 순서
  NodeTypeCd nodeTypeCd;      //경로 유형 코드
  String nodeName;            //경로명
  String  nodeShipExptTime;   //구간 배송 예상 시간
  int nodeDistance;           //구간 배송 거리
  String locationName;        //상/하차지명
  String address;             //지번
  String roadAddress;         //도로명 주소
  String roadAddrDetail;      //도로명 상세주소
  String attachImageUrl1;
  String attachImageUrl2;
  String attachImageUrl3;
  String pltQty;             //파레트 개수
  String orderNo;            //주문 번호
  String locMngName;         //담당자 이름
  String locMngEmail;        //담당자 이메일
  String locMngPhone;        //담당자 전화번호

  var photo = <File>[];


  DeliveryDetail({this.routeId,this.pickLocationId, this.dropLocationId, this.nodeSeq, this.nodeTypeCd, this.nodeName, this.nodeShipExptTime, this.pltQty, this.orderNo,
      this.nodeDistance, this.locationName, this.roadAddress, this.roadAddrDetail, this.attachImageUrl1, this.attachImageUrl2, this.attachImageUrl3, this.address,
      this.locMngName, this.locMngEmail, this.locMngPhone
  });


  DeliveryDetail.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    routeId = intFromJson(json, 'node_id');
    pltQty = stringFromJson(json, 'plt_qty');
    pickLocationId = intFromJson(json, 'pickup_loc_id');
    dropLocationId = intFromJson(json, 'drop_loc_id');
    nodeSeq = intFromJson(json, 'node_seq');
    nodeTypeCd = stringFromJson(json, 'node_type_cd').isNotEmpty ? NodeTypeCd.values.firstWhere((cd) => cd.codeKey == stringFromJson(json, 'node_type_cd')) : null;
    nodeName = stringFromJson(json, 'node_nm');
    nodeShipExptTime = stringFromJson(json, 'node_ship_expt_tm');
    nodeDistance = intFromJson(json, 'node_distance');
    locationName = stringFromJson(json, 'loc_nm');
    roadAddress = stringFromJson(json, 'road_addr');
    roadAddrDetail = stringFromJson(json, 'road_addr_detl');
    attachImageUrl1 = stringFromJson(json, 'attach_img_url_1');
    attachImageUrl2 = stringFromJson(json, 'attach_img_url_2');
    attachImageUrl3 = stringFromJson(json, 'attach_img_url_3');
    orderNo = stringFromJson(json, 'order_no');
    address = stringFromJson(json, 'addr');
    locMngName = stringFromJson(json, 'pickup_loc_mng_nm');
    locMngEmail = stringFromJson(json, 'pickup_loc_mng_email');
    locMngPhone = stringFromJson(json, 'pickup_loc_mng_phone_no');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['pickup_loc_id'] = this.pickLocationId;
    data['plt_qty'] = this.pltQty;
    data['node_id'] = this.routeId;
    data['drop_loc_id'] = this.dropLocationId;
    data['node_seq'] = this.nodeSeq;
    data['node_type_cd'] = this.nodeTypeCd != null ? NodeTypeCd.values.firstWhere((element) => element == this.nodeTypeCd).codeKey : null;
    data['node_nm'] = nodeName;
    data['node_ship_expt_tm'] = this.nodeShipExptTime;
    data['node_distance'] = this.nodeDistance;
    data['loc_nm'] = this.locationName;
    data['road_addr'] = this.roadAddress;
    data['road_addr_detl'] = this.roadAddrDetail;
    data['attach_img_url_1'] = this.attachImageUrl1;
    data['attach_img_url_2'] = this.attachImageUrl2;
    data['attach_img_url_3'] = this.attachImageUrl3;
    data['order_no'] = this.orderNo;
    data['addr'] = this.address;
    data['pickup_loc_mng_nm'] = this.locMngName;
    data['pickup_loc_mng_email'] = this.locMngEmail;
    data['pickup_loc_mng_phone_no'] = this.locMngPhone;

    return data;
  }
}
