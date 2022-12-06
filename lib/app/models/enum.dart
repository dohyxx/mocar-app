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


