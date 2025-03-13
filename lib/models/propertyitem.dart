import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'propertyitem.g.dart';

@JsonSerializable()
class Propertyitem {
    

    String propertiesid;
    String propertiesname;
    String propertieslocation;
    String propertiesdescription;
    String propertiesprice;
    String propertiesimage;
    String statusfav;

    Propertyitem({
      this.propertiesid,
      this.propertiesname,
      this.propertieslocation,
      this.propertiesdescription,
      this.propertiesprice,
      this.propertiesimage,
      this.statusfav
    });
    
    factory Propertyitem.fromJson(Map<String,dynamic> json) => _$PropertyitemFromJson(json);
    Map<String, dynamic> toJson() => _$PropertyitemToJson(this);
}
