import 'package:equatable/equatable.dart';
import 'package:etiya/src/domain/entites/playlist_track/external_urls.dart';
import 'package:json_annotation/json_annotation.dart';

part 'external_urls.g.dart';

@JsonSerializable()
class ExternalUrlsModel extends Equatable {
  final String? spotify;

  const ExternalUrlsModel({this.spotify});

  factory ExternalUrlsModel.fromJson(Map<String, dynamic> json) {
    return _$ExternalUrlsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExternalUrlsModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [spotify];

  ExternalUrls toEntity() => ExternalUrls(spotify: spotify);
}
