import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:latlong/latlong.dart';
import 'package:firebase_storage/firebase_storage.dart';
//import 'package:flutter_map/plugin_api.dart';

import 'audio_player_page.dart';

class MapWidget extends StatefulWidget {
  MapWidget({this.storage});
  final FirebaseStorage storage;

  @override
  MapWidgetState createState() => new MapWidgetState();

}

class MapWidgetState extends State<MapWidget> {
  MapWidgetState({this.storage});
  final FirebaseStorage storage;

  var currentLocation = <String, double>{};

  void initState() {
    super.initState();

    var location = new Location();

    setState(() {
      currentLocation = {
        'logitude': 0,
        'latitude': 0,
      };
    });

    location.getLocation().then((Map<String, double> cL) {
      setState(() {
        currentLocation = cL;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(currentLocation['latitude'], currentLocation['longitude']),
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoiYXpsZW4iLCJhIjoiY2pwNXpmNXZkMTJtZzN3c2FtOXBhZG12eCJ9.8Qd44x7uDZwCTwlmbbCAwA',
            'id': 'mapbox.light',
            'owner': 'azlen',
          },
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 100.0,
              height: 100.0,
              point: new LatLng(49.2879, -123.1127),
              builder: (ctx) =>
              new IconButton(
                icon: new IconTheme(
                  data: new IconThemeData(color: Colors.red),
                  child: const Icon(Icons.place),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/audioplayer');
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

