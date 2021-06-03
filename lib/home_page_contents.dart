import 'package:algorithms_task/action_widgets.dart';
import 'package:algorithms_task/auction_slider.dart';
import 'package:algorithms_task/gallery.dart';
import 'package:flutter/material.dart';

class HomePageContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, children: [
      CarsGallery(),
      AuctionSlider(),
      ActionWidgets(),
    ]);
  }
}
