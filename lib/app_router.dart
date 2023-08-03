// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_naviagtion/main.dart';
import 'package:nested_naviagtion/page_1.dart';
import 'package:nested_naviagtion/page_2.dart';
import 'package:nested_naviagtion/page_3.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _parentKey,
  initialLocation: '/page1',
  routes: [
    ShellRoute(
      parentNavigatorKey: _parentKey,
      navigatorKey: _shellKey,
      builder: (context, state, child) => const RootPage(),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const RootPage(),
          routes: [
            GoRoute(
              path: 'page1',
              builder: (context, state) => const Page1(),
            ),
            GoRoute(
              path: 'page2',
              builder: (context, state) => const Page2(),
            ),
            GoRoute(
              path: 'page3',
              builder: (context, state) => const Page3(),
            )
          ],
        )
      ],
    )
  ],
);
