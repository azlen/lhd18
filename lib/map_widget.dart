import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
//import 'package:flutter_map/plugin_api.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: new LatLng(51.5, -0.09),
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
        //new MarkerLayerOptions(
        //  markers: [
        //    new Marker(
        //      width: 80.0,
        //      height: 80.0,
        //      point: new LatLng(51.5, -0.09),
        //      builder: (ctx) =>
        //      new Container(
        //        child: new FlutterLogo(),
        //      ),
        //    ),
        //  ],
        //),
      ],
    );
  }
}