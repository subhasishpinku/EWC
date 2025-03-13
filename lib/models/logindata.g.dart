// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logindata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Logindata _$LogindataFromJson(Map<String, dynamic> json) {
  return Logindata(
      userid: json['user_id'] as String,
      username: json['user_name'] as String,
      useremail: json['email'] as String,
      usermobile: json['mobile'] as String
     
      );
  
}

Map<String, dynamic> _$LogindataToJson(Logindata instance) => <String, dynamic>{
      'user_id': instance.userid,
      'user_name': instance.username,
      'email': instance.useremail,
      'mobile': instance.usermobile
    };
