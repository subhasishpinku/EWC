// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propertylist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Propertylist _$PropertylistFromJson(Map<String, dynamic> json) {
  return Propertylist(
      status: json['status'] as int,
      message: json['message'] as String,
      properties: json['properties'] as List<dynamic>);
}

Map<String, dynamic> _$PropertylistToJson(Propertylist instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'properties': instance.properties
    };
