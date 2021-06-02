import 'package:algorithms_task/side_menu_header.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  Widget _customListTile(String imageLocation, String title) {
    return ListTile(
      leading: Image.asset(imageLocation),
      title: Text(title, style: TextStyle(color: Color(0xFFFFCE00))),
    );
  }

  Widget _auctions() {
    return _customListTile(
      'assets/auction@3x.png',
      'Auctions',
    );
  }

  Widget _currentAuction() {
    return _customListTile('assets/bid -1@3x.png', 'Current Auction');
  }

  Widget _wallet() {
    return _customListTile('assets/wallet-1@3x.png', 'Wallet');
  }

  Widget _saved() {
    return _customListTile('assets/3180214@3x.png', 'Saved');
  }

  Widget _won() {
    return _customListTile('assets/yes -1@3x.png', 'Won');
  }

  Widget _settings() {
    return _customListTile('assets/setting@3x.png', 'Settings');
  }

  Widget _notifications() {
    return _customListTile('assets/notifications@3x.png', 'Notifications');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      decoration: BoxDecoration(color: Color(0xFF071333)),
      child: ListView(children: [
        SideMenuHeader(),
        _auctions(),
        _currentAuction(),
        _wallet(),
        _saved(),
        _won(),
        _settings(),
        _notifications()
      ]),
    ));
  }
}
