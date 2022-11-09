import 'package:cached_network_image/cached_network_image.dart';
import 'package:etiya/src/presentation/bloc/playlist/playlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// It's a widget that displays the playlist's name, description, and image
class PlaylistWidget extends StatelessWidget {
  const PlaylistWidget({super.key, required this.state});

  final PlaylistHasData state;

  @override
  Widget build(BuildContext context) {
    /// It's a widget that displays the playlist's name, description, and image
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      height: .095.sw + kToolbarHeight,
      child: Row(
        children: [
          /// It's a widget that displays the playlist's image
          // Image.network(
          //   state.playlistData.images![0].url!,
          //   width: .2.sw,
          //   height: .2.sw,
          // ),

          CachedNetworkImage(
            imageUrl: state.playlistData.images![0].url!,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: .2.sw,
            height: .2.sw,
          ),
          25.horizontalSpace,

          /// It's a widget that displays the playlist's name, description, and image
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// It's a widget that displays the playlist's name.
              Text(
                state.playlistData.name!,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white),
              ),

              /// It's a widget that displays the playlist's description.
              Text(
                state.playlistData.description!,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2!
                    .copyWith(color: Colors.white),
              ),
              5.verticalSpace,

              /// It's a widget that displays the text.
              Text(
                'Playlist',
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
