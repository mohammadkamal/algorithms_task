import 'package:algorithms_task/home_page_contents.dart';
import 'package:algorithms_task/side_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _widgets = [HomePageContents(), Container(), Container()];

  Widget _sideMenuButton() {
    return Builder(
      builder: (context) {
        return IconButton(
          color: Color(0xFFFFCE00),
            icon: Icon(CupertinoIcons.text_justifyleft),
            onPressed: () => Scaffold.of(context).openDrawer());
      },
    );
  }

  Widget _searchButton() {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.search,
          color: Color(0xFFFFCE00),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _sideMenuButton(),
          title: Container(
              alignment: Alignment.center,
              child: Image.asset('assets/logo@3x.png')),
          actions: [_searchButton()],
        ),
        drawer: SideMenu(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() {
              _currentIndex = i;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Image.asset('assets/home/3180214@3x.png'), label: ''),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.exclamationmark), label: '')
          ],
        ),
        body: Center(
          child: _widgets.elementAt(_currentIndex),
        ));
  }
}
