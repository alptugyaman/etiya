import 'package:auto_route/auto_route.dart';
import 'package:etiya/src/domain/entites/local_playlist_track.dart';
import 'package:etiya/src/presentation/view/home_view.dart';
import 'package:etiya/src/presentation/view/search_view.dart';

import 'package:etiya/src/presentation/view/splash_view.dart';
import 'package:etiya/src/presentation/view/track_view.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

/// `AppRouter` is a class that extends `_$AppRouter`
/// and is used to generate a `Router` object
@AdaptiveAutoRouter(
  // * for names
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'SplashRouter',
      page: SplashView,
      initial: true,
    ),
    AutoRoute(
      path: '/home',
      name: 'HomeRouter',
      page: HomeView,
    ),
    AutoRoute(
      path: '/track',
      name: 'TrackRouter',
      page: TrackView,
    ),
    CustomRoute(
      path: '/search',
      name: 'SearchRouter',
      page: SearchView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 300,
    ),
  ],
)

/// `AppRouter` is a class that extends `_`
/// and is used to generate a `Router` object
class AppRouter extends _$AppRouter {}
