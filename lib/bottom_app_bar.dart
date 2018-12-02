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

class BottomAppBarPage extends StatelessWidget {
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
          new MapWidget(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.keyboard_voice),
          onPressed: () {
            isRecording ? startRecording(flutterSound) : stopRecording(flutterSound);
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