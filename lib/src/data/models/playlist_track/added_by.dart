import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/added_by.dart';
import 'package:json_annotation/json_annotation.dart';

import 'external_urls.dart';

part 'added_by.g.dart';

@JsonSerializable()
class AddedByModel extends Equatable {
  @JsonKey(name: 'external_urls')
  final ExternalUrlsModel? externalUrls;
  final String? id;
  final String? type;
  final String? uri;

  const AddedByModel({this.externalUrls, this.id, this.type, this.uri});

  factory AddedByModel.fromJson(Map<String, dynamic> json) {
    return _$AddedByModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AddedByModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [externalUrls, id, type, uri];

  AddedBy toEntity() {
    return AddedBy(
      externalUrls: externalUrls?.toEntity(),
      id: id,
      type: type,
      uri: uri,
    );
  }
}
