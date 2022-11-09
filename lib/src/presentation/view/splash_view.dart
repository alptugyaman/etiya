import 'dart:async';
import 'package:etiya/main.dart';
import 'package:etiya/src/config/router/app_router.dart';
import 'package:etiya/src/core/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// `SplashView` is a `StatefulWidget` that creates a
/// `_SplashViewState` when it's built
class SplashView extends StatefulWidget {
  /// It's a constructor.
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  /// > After a delay of 1 seconds, replace the current
  /// route with the AlbumsRouter
  void _gotoHome() {
    Timer(const Duration(milliseconds: 1000), () {
      router.replace(const HomeRouter());
    });
  }

  /// A function that is called when the app is first loaded.
  @override
  void initState() {
    super.initState();
    _gotoHome();
  }

  @override
  Widget build(BuildContext context) {
    /// It's a `Scaffold` widget that contains a `Center` widget that contains a `SvgPicture` widget.
    return Scaffold(body: Center(child: SvgPicture.asset(SVGConstants.logo)));
  }
}
