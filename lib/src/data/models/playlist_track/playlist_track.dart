import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/playlist_track.dart';
import 'package:json_annotation/json_annotation.dart';

import 'item.dart';

part 'playlist_track.g.dart';

@JsonSerializable()
class PlaylistTrackModel extends Equatable {
  @JsonKey(toJson: listToItem)
  final List<ItemModel>? items;
  final int? limit;
  final dynamic next;
  final int? offset;
  final dynamic previous;
  final int? total;

  const PlaylistTrackModel({
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory PlaylistTrackModel.fromJson(Map<String, dynamic> json) {
    return _$PlaylistTrackModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlaylistTrackModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      items,
      limit,
      next,
      offset,
      previous,
      total,
    ];
  }

  PlaylistTrack toEntity() {
    return PlaylistTrack(
      items: items?.map((e) => e.toEntity()).toList(),
      limit: limit,
      next: next,
      offset: offset,
      previous: previous,
      total: total,
    );
  }
}

dynamic listToItem(List<ItemModel>? i) {
  return i?.map((e) => e.toJson()).toList();
}
