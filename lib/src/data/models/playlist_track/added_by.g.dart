// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'added_by.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddedByModel _$AddedByModelFromJson(Map<String, dynamic> json) => AddedByModel(
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrlsModel.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      id: json['id'] as String?,
      type: json['type'] as String?,
      uri: json['uri'] as String?,
    );

Map<String, dynamic> _$AddedByModelToJson(AddedByModel instance) =>
    <String, dynamic>{
      'external_urls': instance.externalUrls,
      'id': instance.id,
      'type': instance.type,
      'uri': instance.uri,
    };
