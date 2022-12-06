import 'package:mocar_test/app/models/delivery/delivery_detail.dart';

import '../parents/model.dart';

class Cost extends Model {

  int costSn;                 //월별정산 일련번호
  String driverName;          //기사명
  String driverPhoneNo;       //기사 휴대폰번호
  String vehicleNo;           //차량번호
  DateTime pickupDate;          //픽업일자
  String dispatchStatus;      //배차상태 코드
  String dispatchCancelDate;  //배차취소 일시
  int shipAmount;             //배송요금
  int plusAmount;             //추가 운송요금
  int minusAmount;            //패널티 운송요금
  int totalAmount;            //전체 운송요금


  Cost({this.costSn, this.driverName, this.driverPhoneNo, this.vehicleNo, this.pickupDate, this.dispatchStatus,
      this.dispatchCancelDate, this.shipAmount, this.plusAmount, this.minusAmount, this.totalAmount});


  Cost.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    costSn = intFromJson(json, 'id');
    driverName = stringFromJson(json, 'driver_nm');
    driverPhoneNo = stringFromJson(json, 'driver_phone_no');
    vehicleNo = stringFromJson(json, 'vehicle_no');
    pickupDate = dateFromJson(json, 'pickup_dt');
    dispatchStatus = stringFromJson(json, 'dispatch_status');
    shipAmount = intFromJson(json, 'ship_amt');
    plusAmount = intFromJson(json, 'plus_amt');
    minusAmount = intFromJson(json, 'minus_amt');
    totalAmount = intFromJson(json, 'total_amt');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.costSn;
    data['driver_nm'] = this.driverName;
    data['driver_phone_no'] = this.driverPhoneNo;
    data["vehicle_no"] = vehicleNo;
    data["pickup_dt"] = pickupDate;
    data['dispatch_status'] = this.dispatchStatus;
    data['ship_amt'] = this.shipAmount;
    data['plus_amt'] = this.plusAmount;
    data['minus_amt'] = this.minusAmount;
    data['total_amt'] = this.totalAmount;

    return data;
  }
}
