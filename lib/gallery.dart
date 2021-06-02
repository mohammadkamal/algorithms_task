import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarsGallery extends StatelessWidget {
  List<Image> _images = [
    Image.asset('assets/home/2017_volvo_xc40_ftq@3x.png'),
    Image.asset('assets/home/2-Honda-Civic@3x.png'),
    Image.asset('assets/home/auto_china_2020_07.png')
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(height: 300),
        items: _images
            .map((e) => Builder(
                builder: (context) => Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: e,
                    )))
            .toList());
  }
}
