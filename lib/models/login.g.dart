// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
      status: json['status'] as int,
      message: json['message'] as String,
      data: Logindata.fromJson(json["data"] as Map<String, dynamic>)
     
      );
 
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data
    };
