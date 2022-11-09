import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/item.dart';
import 'package:json_annotation/json_annotation.dart';

import 'added_by.dart';
import 'track.dart';

part 'item.g.dart';

@JsonSerializable()
class ItemModel extends Equatable {
  @JsonKey(name: 'added_at')
  final String? addedAt;
  @JsonKey(name: 'added_by')
  final AddedByModel? addedBy;
  @JsonKey(name: 'is_local')
  final bool? isLocal;
  @JsonKey(name: 'primary_color')
  final dynamic primaryColor;
  final TrackModel? track;

  const ItemModel({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      addedAt,
      addedBy,
      isLocal,
      primaryColor,
      track,
    ];
  }

  Item toEntity() {
    return Item(
      addedAt: addedAt,
      addedBy: addedBy?.toEntity(),
      isLocal: isLocal,
      primaryColor: primaryColor,
      track: track?.toEntity(),
    );
  }
}
