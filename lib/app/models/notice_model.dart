import 'parents/model.dart';

class Notice extends Model {

  int noticeId;
  String targetTypeCd;
  String title;
  String content;
  String pinYn;
  String file_1;
  String file_2;
  String file_3;
  String file_4;
  String file_5;
  String memo;
  String pubStartTm;
  String pubEndTm;
  int readCnt;
  String createdAt;
  String createdUser;
  DateTime updatedAt;
  String updatedUser;


  Notice({this.noticeId, this.targetTypeCd, this.title, this.content, this.pinYn, this.file_1, this.file_2,
    this.file_3, this.file_4, this.file_5, this.memo, this.pubStartTm, this.pubEndTm, this.readCnt,
    this.createdAt, this.createdUser, this.updatedAt, this.updatedUser});

  Notice.fromJson(Map<String, dynamic> json) {
    noticeId = intFromJson(json, 'id');
    targetTypeCd = stringFromJson(json, 'target_type_cd');
    title = stringFromJson(json, 'title');
    content = stringFromJson(json, 'content');
    pinYn = stringFromJson(json, 'pin_yn');
    file_1 = stringFromJson(json, 'file_1');
    file_2 = stringFromJson(json, 'file_2');
    file_3 = stringFromJson(json, 'file_3');
    file_4 = stringFromJson(json, 'file_4');
    file_5 = stringFromJson(json, 'file_5');
    memo = stringFromJson(json, 'memo');
    pubStartTm = stringFromJson(json, 'pub_start_tm');
    pubEndTm = stringFromJson(json, 'pub_end_tm');
    readCnt = intFromJson(json, 'read_cnt');
    createdAt = stringFromJson(json, 'created_at');
    createdUser = stringFromJson(json, 'created_user');
    updatedAt = dateFromJson(json, 'updated_at');
    updatedUser = stringFromJson(json, 'updated_user');

    super.fromJson(json);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.noticeId;
    data['target_type_cd'] = this.targetTypeCd;
    data['title'] = this.title;
    data['content'] = this.content;
    data['pin_yn'] = this.pinYn;
    data['file_1'] = this.file_1;
    data['file_2'] = this.file_2;
    data['file_3'] = this.file_3;
    data['file_4'] = this.file_4;
    data['file_5'] = this.file_5;
    data['memo'] = this.memo;
    data['pub_start_tm'] = this.pubStartTm;
    data['pub_end_tm'] = this.pubEndTm;
    data['read_cnt'] = this.readCnt;
    data['created_at'] = this.createdAt;
    data["created_user"] = createdUser;
    data["updated_at"] = updatedAt;
    data['updated_user'] = this.updatedUser;

    return data;
  }
}























