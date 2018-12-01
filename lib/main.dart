// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
//import 'package:ui_experiments/extended_text_field.dart';
//import 'package:ui_experiments/rounded_image.dart';
import 'bottom_app_bar.dart';
//import 'google_tasks_bottom_bar.dart';
//import 'sliver.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const Curve scrollCurve = Curves.fastOutSlowIn;
  final PageController controller = new PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'UI Experiments',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/bottom_app_bar': (context) => new BottomAppBarPage(),
        //'/bottom_app_bar_google': (context) => new GoogleTasksBottomAppBarPage(),
      },
      home: new Scaffold(
        body: new PageView(
          controller: controller,
          onPageChanged: (index) => setState(() => _selectedIndex = index),
          children: <Widget>[
            //new MyHomePage(title: 'Home'),
            //new RoundedImageScreen(),
            //new SliverSamplePage(),
            new BottomBarHomePage(),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              controller.animateToPage(
                _selectedIndex,
                duration: kTabScrollDuration,
                curve: scrollCurve,
              );
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.image),
              title: new Text('Image'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.content_cut),
              title: new Text('Sliver'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.border_horizontal),
              title: new Text('App Bar'),
            ),
          ],
        ),
      ),
    );
  }
}
