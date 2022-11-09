import 'package:etiya/src/data/models/playlist_track/added_by.dart';
import 'package:etiya/src/data/models/playlist_track/album.dart';
import 'package:etiya/src/data/models/playlist_track/artist.dart';
import 'package:etiya/src/data/models/playlist_track/external_ids.dart';
import 'package:etiya/src/data/models/playlist_track/external_urls.dart';
import 'package:etiya/src/data/models/playlist_track/image.dart';
import 'package:etiya/src/data/models/playlist_track/item.dart';
import 'package:etiya/src/data/models/playlist_track/playlist_track.dart';
import 'package:etiya/src/data/models/playlist_track/track.dart';
import 'package:etiya/src/domain/entites/playlist_track/added_by.dart';
import 'package:etiya/src/domain/entites/playlist_track/album.dart';
import 'package:etiya/src/domain/entites/playlist_track/artist.dart';
import 'package:etiya/src/domain/entites/playlist_track/external_ids.dart';
import 'package:etiya/src/domain/entites/playlist_track/external_urls.dart';
import 'package:etiya/src/domain/entites/playlist_track/images.dart';
import 'package:etiya/src/domain/entites/playlist_track/item.dart';
import 'package:etiya/src/domain/entites/playlist_track/playlist_track.dart';
import 'package:etiya/src/domain/entites/playlist_track/track.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<ImagesModel>? tImagesModel = const [
    ImagesModel(
      height: 640,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 640,
    ),
    ImagesModel(
      height: 300,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 300,
    ),
    ImagesModel(
      height: 64,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 64,
    )
  ];

  List<Images>? tImages = const [
    Images(
      height: 640,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 640,
    ),
    Images(
      height: 300,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 300,
    ),
    Images(
      height: 64,
      url: "https://i.scdn.co/image/ab67616d0000b273c2e5c58be64d36cd41ecd392",
      width: 64,
    )
  ];

  const tExternalUrlsModelForArtist = ExternalUrlsModel(
    spotify: "https://open.spotify.com/artist/7bchfd9ZihGesFniE7tM71",
  );

  const tArtistsModel = [
    ArtistModel(
      externalUrls: tExternalUrlsModelForArtist,
      id: "7bchfd9ZihGesFniE7tM71",
      name: "Velet",
      type: "artist",
      uri: "spotify:artist:7bchfd9ZihGesFniE7tM71",
    ),
  ];
  const tExternalUrlsForArtist = ExternalUrls(
    spotify: "https://open.spotify.com/artist/7bchfd9ZihGesFniE7tM71",
  );

  const tArtists = [
    Artist(
      externalUrls: tExternalUrlsForArtist,
      id: "7bchfd9ZihGesFniE7tM71",
      name: "Velet",
      type: "artist",
      uri: "spotify:artist:7bchfd9ZihGesFniE7tM71",
    ),
  ];

  const tExternalUrlsModelForAlbum = ExternalUrlsModel(
    spotify: "https://open.spotify.com/artist/4d3ZPCDmC82dHaVwnlS4mx",
  );

  final tAlbumModel = AlbumModel(
    albumType: "single",
    artists: tArtistsModel,
    externalUrls: tExternalUrlsModelForAlbum,
    id: "4d3ZPCDmC82dHaVwnlS4mx",
    images: tImagesModel,
    name: "Son Perde",
    releaseDate: "2022-11-04",
    releaseDatePrecision: "day",
    totalTracks: 4,
    type: "album",
    uri: "spotify:album:4d3ZPCDmC82dHaVwnlS4mx",
  );

  const tExternalUrlForAlbum = ExternalUrls(
    spotify: "https://open.spotify.com/artist/4d3ZPCDmC82dHaVwnlS4mx",
  );

  final tAlbum = Album(
    albumType: "single",
    artists: tArtists,
    externalUrls: tExternalUrlForAlbum,
    id: "4d3ZPCDmC82dHaVwnlS4mx",
    images: tImages,
    name: "Son Perde",
    releaseDate: "2022-11-04",
    releaseDatePrecision: "day",
    totalTracks: 4,
    type: "album",
    uri: "spotify:album:4d3ZPCDmC82dHaVwnlS4mx",
  );

  const tExternalIdsModel = ExternalIdsModel(isrc: "QMDA62291437");

  const tExternalUrlsModel =
      ExternalUrlsModel(spotify: "https://open.spotify.com/track/2Ti1LrtGjQYU2eBA9R7JGx");

  final tTrackModel = TrackModel(
    album: tAlbumModel,
    artists: tArtistsModel,
    discNumber: 1,
    durationMs: 140000,
    episode: false,
    explicit: false,
    externalIds: tExternalIdsModel,
    externalUrls: tExternalUrlsModel,
    id: "2Ti1LrtGjQYU2eBA9R7JGx",
    isLocal: false,
    isPlayable: true,
    name: "Uçurumlar",
    popularity: 54,
    previewUrl:
        "https://p.scdn.co/mp3-preview/7b5ee496d629ab6322512a4eb134338703866205?cid=f6a40776580943a7bc5173125a1e8832",
    track: true,
    trackNumber: 1,
    type: "track",
    uri: "spotify:track:4h9wh7iOZ0GGn8QVp4RAOB",
  );

  const tExternalIds = ExternalIds(isrc: "QMDA62291437");
  const tExternalUrls =
      ExternalUrls(spotify: "https://open.spotify.com/track/2Ti1LrtGjQYU2eBA9R7JGx");

  final tTrack = Track(
    album: tAlbum,
    artists: tArtists,
    discNumber: 1,
    durationMs: 140000,
    episode: false,
    explicit: false,
    externalIds: tExternalIds,
    externalUrls: tExternalUrls,
    id: "2Ti1LrtGjQYU2eBA9R7JGx",
    isLocal: false,
    isPlayable: true,
    name: "Uçurumlar",
    popularity: 54,
    previewUrl:
        "https://p.scdn.co/mp3-preview/7b5ee496d629ab6322512a4eb134338703866205?cid=f6a40776580943a7bc5173125a1e8832",
    track: true,
    trackNumber: 1,
    type: "track",
    uri: "spotify:track:4h9wh7iOZ0GGn8QVp4RAOB",
  );

  const tExternalUrlsModelSpotify = ExternalUrlsModel(spotify: "https://open.spotify.com/user/");

  const tAddedByModel = AddedByModel(
    externalUrls: tExternalUrlsModelSpotify,
    id: "",
    type: "user",
    uri: "spotify:user:",
  );

  const tExternalUrlsSpotify = ExternalUrls(spotify: "https://open.spotify.com/user/");

  const tAddedBy = AddedBy(
    externalUrls: tExternalUrlsSpotify,
    id: "",
    type: "user",
    uri: "spotify:user:",
  );

  final tItemsModel = ItemModel(
    addedAt: "2022-11-04T08:05:35Z",
    addedBy: tAddedByModel,
    isLocal: false,
    primaryColor: null,
    track: tTrackModel,
  );

  final tItems = Item(
    addedAt: "2022-11-04T08:05:35Z",
    addedBy: tAddedBy,
    isLocal: false,
    primaryColor: null,
    track: tTrack,
  );

  final tPlaylistTrackModel = PlaylistTrackModel(
    items: [tItemsModel],
    limit: 1,
    next: true,
    offset: 0,
    previous: null,
    total: 101,
  );

  final tPlaylistTrack = PlaylistTrack(
    items: [tItems],
    limit: 1,
    next: true,
    offset: 0,
    previous: null,
    total: 101,
  );

  group('to entity', () {
    test(
      'should be a subclass of Playlist entity',
      () async {
        final result = tPlaylistTrackModel.toEntity();
        expect(result, equals(tPlaylistTrack));
      },
    );
  });
}
