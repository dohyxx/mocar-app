import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

/**
 * 차량 구분
 */
enum VehicleType {
  TYPE_1,      // 1톤 차량
  TYPE_2,      // 2.5톤 차량
  TYPE_3,      // 3.5톤 차량
  TYPE_5,      // 5톤 차량
  TYPE_11,     // 11톤 차량
  TYPE_18,     // 18톤 차량
  TYPE_25,     // 25톤 차량
}
extension WtChangeSeCdExtension1 on VehicleType {
  String get codeName {
    switch(this){
      case VehicleType.TYPE_1: return "1톤 차량";
      case VehicleType.TYPE_2: return "2.5톤 차량";
      case VehicleType.TYPE_3: return "3.5톤 차량";
      case VehicleType.TYPE_5: return "5톤 차량";
      case VehicleType.TYPE_11: return "11톤 차량";
      case VehicleType.TYPE_18: return "18톤 차량";
      case VehicleType.TYPE_25: return "25톤 차량";
      default: return null;
    }
  }
}


/**
 * 상하차지 구부
 */
enum NodeTypeCd {
  P,
  E,
  S,
}
extension NodeTypeCdExtension1 on NodeTypeCd {
  String get codeKey {
    return this.name;
  }
}

extension nodeTypeCdExtension2 on NodeTypeCd {
  String get codeName {
    switch(this){
      case NodeTypeCd.P: return "상차지";
      case NodeTypeCd.E: return "하차지";
      case NodeTypeCd.S: return "하차지";
      default: return null;
    }
  }
}


/**
 * 운반 업무 코드
 */
enum DriverWorkState {
  M01,   // 시작 전
  M02,   // 운반 중
  M03,   // 완료
}
extension DriverWorkStateExtension1 on DriverWorkState {
  String get stateText {
    switch(this){
      case DriverWorkState.M01: return "배송 시작";
      case DriverWorkState.M02: return "배송 중";
      case DriverWorkState.M03: return "배송 완료";
      default: return null;
    }
  }
}
extension DriverWorkStateExtension2 on DriverWorkState {
  Color get stateColor {
    switch(this){
      case DriverWorkState.M01: return Color(0xff00918f);
      case DriverWorkState.M02: return Color(0xff01389c);
      case DriverWorkState.M03: return Color(0xff3d3d3d);
      default: return null;
    }
  }
}

