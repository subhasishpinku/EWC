import 'package:json_annotation/json_annotation.dart';

part 'logindata.g.dart';

@JsonSerializable()
class Logindata {
  String userid;
  String username;
  String useremail;
  String usermobile;

  Logindata({this.userid, this.username, this.useremail, this.usermobile});

  factory Logindata.fromJson(Map<String, dynamic> json) =>
      _$LogindataFromJson(json);
  Map<String, dynamic> toJson() => _$LogindataToJson(this);
}
