// ignore_for_file: depend_on_referenced_packages

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_naviagtion/app_router.dart';
import 'package:nested_naviagtion/page_1.dart';
import 'package:nested_naviagtion/page_2.dart';
import 'package:nested_naviagtion/page_3.dart';

final pageList = [
  const Page1(),
  const Page2(),
  const Page3(),
];

void main() {
  usePathUrlStrategy();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({
    super.key,
  });

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 32,
        ),
        child: Row(
          children: [
            Container(
              color: Colors.grey.shade300,
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 32,
              ),
              child: Column(
                children: pageList.mapIndexed(
                  (index, e) {
                    bool isSelected = index == _selectedPageIndex;
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedPageIndex = index;
                        });
                        switch (_selectedPageIndex) {
                          case 0:
                            return context.go('/page1');
                          case 1:
                            return context.go('/page2');
                          case 2:
                            return context.go('/page3');
                        }
                      },
                      child: Column(
                        children: [
                          Text(
                            e.toString(),
                          ),
                          if (isSelected)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 2,
                              ),
                              width: 100,
                              height: 2,
                              color: Colors.red,
                            ),
                        ],
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            Expanded(
              child: pageList[_selectedPageIndex],
            )
          ],
        ),
      ),
    );
  }
}
