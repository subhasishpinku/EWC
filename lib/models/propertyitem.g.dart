// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'propertyitem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Propertyitem _$PropertyitemFromJson(Map<String, dynamic> json) {
  return Propertyitem(
    propertiesid : json['properties_id'] as String,
    propertiesname : json['properties_name'] as String,
    propertieslocation : json['properties_location'] as String,
    propertiesdescription :json['properties_description'] as String,
    propertiesprice : json['properties_price'] as String,
    propertiesimage : json['properties_image'] as String,
    statusfav: json['status_fav'] as String
  );
    
}

Map<String, dynamic> _$PropertyitemToJson(Propertyitem instance) =>
    <String, dynamic>{
      'properties_id': instance.propertiesid,
      'properties_name': instance.propertiesname,
      'properties_location': instance.propertieslocation,
      'properties_description': instance.propertiesdescription,
      'properties_price': instance.propertiesprice,
      'properties_image': instance.propertiesimage,
      'status_fav': instance.statusfav
    };
