import 'package:etiya/src/core/functions/time_converts.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrackView extends StatelessWidget {
  const TrackView({super.key, required this.localPlaylistTrack});

  final LocalPlaylistTrack localPlaylistTrack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Creating an AppBar with the title of the song.
      appBar: AppBar(title: Text(localPlaylistTrack.songName!)),

      /// Creating a column with the song's image, name, artists and duration.
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(localPlaylistTrack.image!),
            15.verticalSpace,
            Text(
              localPlaylistTrack.songName!,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            5.verticalSpace,
            Text(
              localPlaylistTrack.artists!,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            5.verticalSpace,
            Text(
              TimeConverts.millisecondstoMinute(
                Duration(milliseconds: localPlaylistTrack.duration!),
              ),
            )
          ],
        ),
      ),
    );
  }
}
