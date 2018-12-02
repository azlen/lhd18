

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
  List<String> recordings = new List<String>();
  List<io.File> fileRecordings = new List<io.File>();

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
          new MapWidget(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.keyboard_voice),
          onPressed: () {
            if (!isRecording) {
              startRecording(flutterSound).then((recordingPath) {
                recordings.add(recordingPath);
                io.File file = new io.File(recordingPath);
                fileRecordings.add(file);
                print(recordings.last);
              }).catchError((e) {
                print(e);
              });
            } else {
              stopRecording(flutterSound, recordings.last);
            }
            isRecording = !isRecording;
          }
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

Future<String> startRecording(FlutterSound flutterSound) async {
  String path;
  try {
    io.Directory appDocDir = await getApplicationDocumentsDirectory();
    var uuid = new Uuid();
    path = appDocDir.path + "/" + uuid.v1();

    print("Start recording: $path");
    if (path != null) {
      await flutterSound.startRecorder(path);
    } else {
      await flutterSound.startRecorder(null);
    }
  } catch(e) {
    print(e);
  }

  return path;
}

stopRecording(FlutterSound flutterSound, String path) async {
  try{
    String result = await flutterSound.stopRecorder();
    await playRecording(flutterSound, path);
  } catch(e) {
    print(e);
  }
}

playRecording(FlutterSound flutterSound, String path) async {
  try {
    await flutterSound.startPlayer(path);
  } catch (e) {
    print(e);
  }
}

stopPlayRecording(FlutterSound flutterSound) async {
  try {
    await flutterSound.stopPlayer();
  } catch(e) {
    print(e);
  }
}