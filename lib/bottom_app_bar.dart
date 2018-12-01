import 'package:flutter/material.dart';
import 'map_widget.dart';

class BottomAppBarPage extends StatelessWidget {
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
        onPressed: () {},
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