import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/external_ids.dart';
import 'package:json_annotation/json_annotation.dart';

part 'external_ids.g.dart';

@JsonSerializable()
class ExternalIdsModel extends Equatable {
  final String? isrc;

  const ExternalIdsModel({this.isrc});

  factory ExternalIdsModel.fromJson(Map<String, dynamic> json) {
    return _$ExternalIdsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExternalIdsModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isrc];

  ExternalIds toEntity() => ExternalIds(isrc: isrc);
}
