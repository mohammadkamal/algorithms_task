import 'package:flutter/material.dart';

class ActionWidgets extends StatefulWidget {
  @override
  _ActionWidgetsState createState() => _ActionWidgetsState();
}

class _ActionWidgetsState extends State<ActionWidgets> {
  final _decoration = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)), color: Colors.white);

  Widget _auctions() {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.height / 6,
      decoration: _decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/home/32274@3x.png'),
          Text('Auctions'.toUpperCase())
        ],
      ),
    );
  }

  Widget _finder() {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.height / 6,
      decoration: _decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.search), Text('Finder'.toUpperCase())],
      ),
    );
  }

  Widget _myCars() {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 6,
      decoration: _decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/home/55180@3x.png'),
          Text('My Cars'.toUpperCase())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_auctions(), _finder()],
        ),
        _myCars()
      ],
    );
  }
}
