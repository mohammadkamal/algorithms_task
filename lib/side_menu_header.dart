import 'package:algorithms_task/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenuHeader extends StatefulWidget {
  @override
  _SideMenuHeaderState createState() => _SideMenuHeaderState();
}

class _SideMenuHeaderState extends State<SideMenuHeader> {
  String _name = '', _address = '';
  bool _isLoggedIn = false;

  @override
  void initState() {
    _getAccountInfo();
    super.initState();
  }

  Future<void> _getAccountInfo() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('logged_in')!;
    _name = prefs.getString('name')!;
    _address = prefs.getString('address')!;
    setState(() {});
  }

  Widget _loggedInWidget() {
    return Column(
      children: [
        Image.asset('assets/account@3x.png'),
        Text(
          _name,
          style: TextStyle(
              color: Color(
                0xFFFFCE00,
              ),
              fontWeight: FontWeight.bold,
              fontSize: 15),
        ),
        Text(
          _address,
          style: TextStyle(color: Color(0xFFFFCE00)),
        )
      ],
    );
  }

  Widget _notLoggedIn() {
    return ElevatedButton(
      child: Text('Log in'),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        child: Container(
            alignment: Alignment.center,
            child: _isLoggedIn ? _loggedInWidget() : _notLoggedIn()));
  }
}
