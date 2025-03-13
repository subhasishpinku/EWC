import 'package:json_annotation/json_annotation.dart';

part 'messages.g.dart';

@JsonSerializable()
class Messages {
  
    int status;
    String message;
    Messages({this.status,this.message});
    factory Messages.fromJson(Map<String,dynamic> json) => _$MessagesFromJson(json);
    Map<String, dynamic> toJson() => _$MessagesToJson(this);
}
