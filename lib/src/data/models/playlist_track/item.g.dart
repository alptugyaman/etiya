// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      addedAt: json['added_at'] as String?,
      addedBy: json['added_by'] == null
          ? null
          : AddedByModel.fromJson(json['added_by'] as Map<String, dynamic>),
      isLocal: json['is_local'] as bool?,
      primaryColor: json['primary_color'],
      track: json['track'] == null
          ? null
          : TrackModel.fromJson(json['track'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'added_at': instance.addedAt,
      'added_by': instance.addedBy,
      'is_local': instance.isLocal,
      'primary_color': instance.primaryColor,
      'track': instance.track,
    };
