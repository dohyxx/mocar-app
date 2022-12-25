import 'package:mocar_test/app/models/delivery/delivery_detail.dart';

import '../parents/model.dart';

class Delivery extends Model {

  int delSn;                //id 일련번호
  String pickUpDate;        //픽업_일자
  int totalPaltQuantity;    //전체 파레트 수량
  int totalDistance;        //전체 배송 거리
  int vehicleRtTotalCount;  //배차 경로 총 개수 -> 경유지 개수
  String shipCompleteYn;      //배송 완료 여부
  String dispatchStatus;    //배차 상태 코드
  int shipAmount;           //배송요금
  int plusAmount;           //추가 운송요금
  int minusAmount;          //패널티 운송요금
  int totalAmount;          //전체 운송요금
  var deliveryDetail = <DeliveryDetail>[]; //배송 상세 내역

  int routeCnt;             //총 경유지 수


  Delivery({this.delSn, this.pickUpDate, this.totalPaltQuantity, this.totalDistance, this.vehicleRtTotalCount, this.shipCompleteYn,
      this.dispatchStatus, this.shipAmount, this.plusAmount, this.minusAmount, this.totalAmount, this.deliveryDetail});


  Delivery.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    delSn = intFromJson(json, 'id');
    pickUpDate = stringFromJson(json, 'pickup_dt');
    totalPaltQuantity = intFromJson(json, 'total_palt_qty');
    totalDistance = intFromJson(json, 'total_distance');
    vehicleRtTotalCount = intFromJson(json, 'vehicleRouteTotalCount');
    shipCompleteYn = stringFromJson(json, 'ship_complete_yn');
    dispatchStatus = stringFromJson(json, 'dispatch_status');
    shipAmount = intFromJson(json, 'ship_amt');
    plusAmount = intFromJson(json, 'plus_amt');
    minusAmount = intFromJson(json, 'minus_amt');
    totalAmount = intFromJson(json, 'total_amt');
    deliveryDetail = listFromJson(json, 'vehicleRoutes', (v) => DeliveryDetail.fromJson(v));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.delSn;
    data['pickup_dt'] = this.pickUpDate;
    data['total_palt_qty'] = this.totalPaltQuantity;
    data["total_distance"] = totalDistance;
    data["vehicleRouteTotalCount"] = vehicleRtTotalCount;
    data['ship_complete_yn'] = this.shipCompleteYn;
    data['dispatch_status'] = this.dispatchStatus;
    data['ship_amt'] = this.shipAmount;
    data['plus_amt'] = this.plusAmount;
    data['minus_amt'] = this.minusAmount;
    data['total_amt'] = this.totalAmount;

    return data;
  }
}
