import 'model.dart';

/**
 * 페이징 모델
 */
class Paging extends Model {
  int currentPage;
  int lastPage = 0;
  int perPage;            // 페이지당 컨텐츠 수
  int total;              // 전체 컨텐츠 수
  // List<dynamic> data;     // 컨텐츠

  Paging({
    this.currentPage, this.lastPage, this.perPage,
    this.total,
    // this.data
  });

  Paging.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    currentPage = intFromJson(json, 'current_page');
    lastPage = intFromJson(json, 'last_page');
    perPage = intFromJson(json, 'per_page');
    total = intFromJson(json, 'total');
    // if(T is ExhstRequestStatus){
    //   data = listFromJson(json, 'data', (v) => ExhstRequestStatus.fromJson(v));
    // }
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    data['last_page'] = this.lastPage;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    // data['data'] = this.data;
    return data;
  }
}