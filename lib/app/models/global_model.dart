import 'parents/model.dart';

class Global extends Model {
  String mockBaseUrl;
  String laravelBaseUrl;
  String apiPath;
  int received;
  int accepted;
  int onTheWay;
  int ready;
  int inProgress;
  int done;
  int failed;
  String conveyancePhotoPreUrl;
  String tmapFullUrl;
  String s3FileViewUrl;
  String mode;


  Global({this.mockBaseUrl, this.laravelBaseUrl, this.apiPath});

  Global.fromJson(Map<String, dynamic> json) {
    mockBaseUrl = json['mock_base_url'].toString();
    laravelBaseUrl = json['laravel_base_url'].toString();
    apiPath = json['api_path'].toString();
    received = intFromJson(json, 'received');
    accepted = intFromJson(json, 'accepted');
    onTheWay = intFromJson(json, 'on_the_way');
    ready = intFromJson(json, 'ready');
    inProgress = intFromJson(json, 'in_progress');
    done = intFromJson(json, 'done');
    failed = intFromJson(json, 'failed');
    conveyancePhotoPreUrl = stringFromJson(json, 'conveyance_photo_pre_url');
    tmapFullUrl = stringFromJson(json, 'tmap_full_url');
    s3FileViewUrl = '${laravelBaseUrl}${apiPath}common/s3-file/view';
    mode = stringFromJson(json, 'mode');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['mock_base_url'] = this.mockBaseUrl;
    data['laravel_base_url'] = this.laravelBaseUrl;
    data['api_path'] = this.apiPath;
    data['conveyance_photo_pre_url'] = this.conveyancePhotoPreUrl;
    data['tmap_full_url'] = this.conveyancePhotoPreUrl;
    data['s3FileViewUrl'] = this.s3FileViewUrl;
    data['mode'] = this.mode;
    return data;
  }
}
