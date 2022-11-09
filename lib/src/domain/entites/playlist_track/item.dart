import 'package:equatable/equatable.dart';

import 'added_by.dart';
import 'track.dart';
import 'video_thumbnail.dart';

class Item extends Equatable {
  final String? addedAt;
  final AddedBy? addedBy;
  final bool? isLocal;
  final dynamic primaryColor;
  final Track? track;
  final VideoThumbnail? videoThumbnail;

  const Item({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

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
      videoThumbnail,
    ];
  }
}
