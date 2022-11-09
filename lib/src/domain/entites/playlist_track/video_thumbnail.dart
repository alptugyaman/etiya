import 'package:equatable/equatable.dart';

class VideoThumbnail extends Equatable {
  final dynamic url;

  const VideoThumbnail({this.url});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [url];
}
