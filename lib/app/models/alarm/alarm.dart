
import '../parents/model.dart';

/**
 * 알림내역 모델
 */
class Alarm extends Model {
  int alarmId;            // 알림 일련번호
  String targetTypeCd;    // 알림 대상코드
  String recvUserId;      // 수신자 아이디
  String title;           // 제목
  String content;         // 내용
  String  notiTypeCd;     // 알림유형코드
  String linkUrl;         // 링크 URL
  DateTime noticeDate;      // 알림 일자
  String readYn;          // 읽음 여부
  DateTime createdDate;   // 등록일시
  String createdUser;     // 등록자

  Alarm({
    this.alarmId, this.targetTypeCd, this.recvUserId,
    this.title, this.content, this.notiTypeCd, this.linkUrl,
    this.createdDate, this.createdUser, this.noticeDate, this.readYn
  });

  Alarm.fromJson(Map<String, dynamic> json) {
    super.fromJson(json);
    alarmId = intFromJson(json, 'id');
    targetTypeCd = stringFromJson(json, 'target_type_cd');
    recvUserId = stringFromJson(json, 'recv_user_id');
    title = stringFromJson(json, 'title');
    content = stringFromJson(json, 'content');
    notiTypeCd = stringFromJson(json, 'noti_type_cd');
    linkUrl = stringFromJson(json, 'link_url');
    readYn = stringFromJson(json, 'read_yn');
    createdDate = dateFromJson(json, 'created_at');
    noticeDate = dateFromJson(json, 'noti_dt');
    createdUser = stringFromJson(json, 'created_user');

  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.alarmId;
    data['target_type_cd'] = this.targetTypeCd;
    data['recv_user_id'] = this.recvUserId;
    data['title'] = this.title;
    data['content'] = this.content;
    data['noti_type_cd'] = this.notiTypeCd;
    data['link_url'] = this.linkUrl;
    data['read_yn'] = this.readYn;
    data['created_at'] = this.createdDate;
    data['noti_dt'] = this.noticeDate;
    data['created_user'] = this.createdUser;
    return data;
  }
}
