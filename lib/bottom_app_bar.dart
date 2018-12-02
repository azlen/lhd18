

import 'package:flutter/material.dart';
import 'map_widget.dart';
import 'package:flutter_sound/flutter_sound.dart';


import 'dart:io' as io;
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:firebase_storage/firebase_storage.dart';

class BottomAppBarPage extends StatelessWidget {
  BottomAppBarPage({this.storage});
  final FirebaseStorage storage;

  FlutterSound flutterSound = new FlutterSound();
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: const Text('Bard')),
      body: new PageView(
        //controller: controller,
        //onPageChanged: (index) => setState(() => _selectedIndex = index),
        children: <Widget>[
          //new MyHomePage(title: 'Home'),
          //new RoundedImageScreen(),
          //new SliverSamplePage(),
          new MapWidget(storage: storage),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: "record",
        child: const Icon(Icons.keyboard_voice),
          onPressed: () {
            isRecording ? startRecording(flutterSound) : stopRecording(flutterSound);
            isRecording = !isRecording;
          }
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: new IconTheme(
                data: new IconThemeData(color: Colors.white),
                child: const Icon(Icons.menu),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

startRecording(FlutterSound flutterSound) async {
  try {
      io.Directory appDocDir = await getApplicationDocumentsDirectory();
      var uuid = new Uuid();
      String path = appDocDir.path + "/" + uuid.v1();

      print("Start recording: $path");

      if (path != null) {
        await flutterSound.startRecorder(path);
      } else {
        await flutterSound.startRecorder(null);
      }
    } catch(e) {
    print(e);
  }
}

stopRecording(FlutterSound flutterSound) async {
}