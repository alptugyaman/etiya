import 'package:cached_network_image/cached_network_image.dart';
import 'package:etiya/main.dart';
import 'package:etiya/src/config/router/app_router.dart';
import 'package:etiya/src/core/functions/time_converts.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:flutter/material.dart';

/// It's a stateless widget that takes in the data from the local playlist
///  and displays it in a list tile
class CustomListTiles extends StatelessWidget {
  const CustomListTiles({
    super.key,
    required this.image,
    required this.songName,
    required this.artists,
    required this.duration,
  });

  final String image;
  final String songName;
  final String artists;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        /// I used this method both with the data from the local and ,
        /// the data from the remote so that I can go to the next page.
        final localPlaylistTrack = LocalPlaylistTrack(
          songName: songName,
          artists: artists,
          image: image,
          duration: duration,
        );

        router.push(TrackRouter(localPlaylistTrack: localPlaylistTrack));
      },
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      minLeadingWidth: 60,
      leading: CachedNetworkImage(
        imageUrl: image,
        errorWidget: (context, url, error) => const Icon(Icons.error),
        width: 60,
      ),
      title: Text(
        songName,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(artists),
      trailing: Text(
          TimeConverts.millisecondstoMinute(Duration(milliseconds: duration))),
    );
  }
}
