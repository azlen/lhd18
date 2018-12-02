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

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'dart:async';
import 'dart:typed_data';
import 'dart:io';
import 'audio_player_page.dart';


void main() async{
  final FirebaseApp app = await FirebaseApp.configure(
    name: 'test',
    options: FirebaseOptions(
      googleAppID: Platform.isIOS
          ? '1:159623150305:ios:4a213ef3dbd8997b'
          : '1:159623150305:android:ef48439a0cc0263d',
      gcmSenderID: '159623150305',
      apiKey: 'AIzaSyChk3KEG7QYrs4kQPLP1tjJNxBTbfCAdgg',
      projectID: 'flutter-firebase-plugins',
    ),
  );
  final FirebaseStorage storage = FirebaseStorage(
      app: app, storageBucket: 'gs://flutter-firebase-plugins.appspot.com');
  runApp(MyApp(storage: storage));
}


class MyApp extends StatelessWidget {
  MyApp({this.storage});
  final FirebaseStorage storage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Storage Example',
      home: MyHomePage(storage: storage),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({this.storage});
  final FirebaseStorage storage;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({this.storage});
  final FirebaseStorage storage;

  static const Curve scrollCurve = Curves.fastOutSlowIn;
  final PageController controller = new PageController();

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'UI Experiments',
      theme: new ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.black,
        primaryColor: Colors.white,
      ),
      routes: {
        '/audioplayer': (context) => new AudioPlayerPage(),
        //'/bottom_app_bar_google': (context) => new GoogleTasksBottomAppBarPage(),
      },
      home: new Scaffold(
        body: new PageView(
          controller: controller,
          // onPageChanged: (index) => setState(() => _selectedIndex = index),
          children: <Widget>[
            //new MyHomePage(title: 'Home'),
            //new RoundedImageScreen(),
            //new SliverSamplePage(),
            new BottomAppBarPage(storage: storage),
          ],
        ),
      ),
    );
  }
}
