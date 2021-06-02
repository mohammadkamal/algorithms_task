import 'package:algorithms_task/auction_item.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AuctionSlider extends StatelessWidget {
  List<AuctionItem> _auctionItems = [
    AuctionItem(
      image: Image.asset('assets/home/ms-homepage-desktop@3x.png'),
      title: 'Tesla 2021',
      id: 'Lot/item#32178291',
      address: 'Halban - The Sultanate of Oman'.toUpperCase(),
      price: '195,306',
      inDueTime: DateTime(2021, 6, 6, 23, 50, 16),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(height: 300),
        items: _auctionItems
            .map((e) => Builder(
                builder: (context) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: e,
                    )))
            .toList());
  }
}
