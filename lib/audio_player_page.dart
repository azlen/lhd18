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

import 'package:firebase_storage/firebase_storage.dart';

class AudioPlayerPage extends StatefulWidget {
  AudioPlayerPage({this.storage});
  final FirebaseStorage storage;

  @override
  _AudioPlayerPageState createState() => new _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  _AudioPlayerPageState({this.storage});
  final FirebaseStorage storage;

  Icon currentIcon = Icon(Icons.play_arrow);
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          heroTag: "play",
          child: currentIcon,
          onPressed: () {
            setState(() {

              if(currentIcon.toString() == Icon(Icons.play_arrow).toString()) {
                currentIcon = Icon(Icons.pause);
              } else {
                currentIcon = Icon(Icons.play_arrow);
              }
            });
          },
          //isRecording ? startRecording() : stopRecording();
          //isRecording = !isRecording;
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