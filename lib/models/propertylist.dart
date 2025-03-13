import 'package:EWC/models/index.dart';
import 'package:json_annotation/json_annotation.dart';
part 'propertylist.g.dart';

@JsonSerializable()
class Propertylist {
    Propertylist({
      this.status,
      this.message,
      this.properties
    });

    int status;
    String message;
    List<Propertyitem> properties;

    
    factory Propertylist.fromJson(Map<String,dynamic> json) => _$PropertylistFromJson(json);
    Map<String, dynamic> toJson() => _$PropertylistToJson(this);
}
