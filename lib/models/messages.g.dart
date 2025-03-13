// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Messages _$MessagesFromJson(Map<String, dynamic> json) {
  return Messages(
    status: json["status"] as int,
    message: json["message"] as String

  );
    // ..status = json['status'] as num
    // ..message = json['message'] as String;
}

Map<String, dynamic> _$MessagesToJson(Messages instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};
