import 'package:flutter/material.dart';
import 'map_widget.dart';

import 'dart:io' as io;
import 'dart:math';

import 'package:audio_recorder/audio_recorder.dart';
import 'package:file/file.dart';
import 'package:file/local.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class BottomAppBarPage extends StatelessWidget {
  //bool isRecording;
  //Recording recording = new Recording();

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
            //isRecording ? startRecording() : stopRecording();
            //isRecording = !isRecording;
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

startRecording() async {
  try {
    if (await AudioRecorder.hasPermissions) {
      io.Directory appDocDir = await getApplicationDocumentsDirectory();
      var uuid = new Uuid();
      String path = appDocDir.path + "/" + uuid.v1();

      print("Start recording: $path");

      if (path != null) {
        await AudioRecorder.start(
            path: path, audioOutputFormat: AudioOutputFormat.AAC);
      } else {
        await AudioRecorder.start();
      }

//      bool isRecording = await AudioRecorder.isRecording;
//      setState(() {
//        isRecording = isRecording;
//        recording = new Recording(duration: new Duration(), path: "");
//      });

    } else {
    }
  } catch(e) {
    print(e);
  }
}

stopRecording() async {
}