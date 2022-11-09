import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class LocalPlaylistTrack extends Equatable {
  @PrimaryKey()
  final String? image;
  final String? songName;
  final String? artists;
  final int? duration;

  const LocalPlaylistTrack({
    this.image,
    this.songName,
    this.artists,
    this.duration,
  });

  @override
  List<Object?> get props => [
        image,
        songName,
        artists,
        duration,
      ];

  @override
  bool get stringify => true;
}
