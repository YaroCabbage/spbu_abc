// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:abc_sbpu_project/screens/detail_screen.dart' as _i1;
import 'package:abc_sbpu_project/screens/main_screen.dart' as _i2;
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.DetailScreen]
class DetailRoute extends _i3.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    _i4.Key? key,
    required String letter,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            letter: letter,
          ),
          rawPathParams: {'letter': letter},
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<DetailRouteArgs>(
          orElse: () =>
              DetailRouteArgs(letter: pathParams.getString('letter')));
      return _i1.DetailScreen(
        key: args.key,
        letter: args.letter,
      );
    },
  );
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.letter,
  });

  final _i4.Key? key;

  final String letter;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, letter: $letter}';
  }
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainScreen();
    },
  );
}
