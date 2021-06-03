import 'package:flutter/material.dart';

class AuctionItem extends StatefulWidget {
  final Image image;
  final String title, id, address, price;
  final DateTime inDueTime;

  const AuctionItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.id,
      required this.address,
      required this.price,
      required this.inDueTime})
      : super(key: key);
  @override
  _AuctionItemState createState() => _AuctionItemState();
}

class _AuctionItemState extends State<AuctionItem> {
  final _textStyle = TextStyle(color: Colors.white);
  DateTime _nowTime = DateTime.now();
  late Duration _timeDiff;

  void initState() {
    super.initState();
    setState(() {
      _timeDiff = widget.inDueTime.difference(_nowTime);
    });
  }

  Widget _imageSection() {
    return Container(
      alignment: Alignment.topLeft,
      child: FittedBox(child: widget.image, fit: BoxFit.fill),
      width: 300,
      height: 300,
    );
  }

  Widget _carSpecs() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Color(0xFFFFCE00), fontWeight: FontWeight.bold),
              softWrap: true,
            ),
          ),
          Container(
            width: 150,
            child: Text(
              widget.id,
              style: _textStyle,
              softWrap: true,
            ),
          ),
          Container(
              width: 150,
              child: Text(
                widget.address,
                style: _textStyle,
                softWrap: true,
              )),
          Container(
              width: 150,
              child: Text(
                'ODO: ${widget.price}',
                style: _textStyle,
                softWrap: true,
              ))
        ],
      ),
    );
  }

  Widget _timeSection() {
    return Container(
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'auction starts at',
              style: TextStyle(color: Color(0xFFFFCE00)),
            ),
            Container(
              padding: EdgeInsets.only(left:5,right: 5),
                child: Text(
                    '${_timeDiff.inDays}d : ${_timeDiff.inHours - _timeDiff.inDays * 24}h : ${_timeDiff.inMinutes - _timeDiff.inHours * 60}m'),
                decoration: BoxDecoration(
                    color: Color(0xFFFFCE00),
                    borderRadius: BorderRadius.all(Radius.circular(20))))
          ],
        ));
  }

  Widget _infoSection() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
            color: Color(0xFF071333)),
        width: 285,
        height: 150,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_carSpecs(), _timeSection()],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 300,
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [_imageSection(), _infoSection()],
          ),
        ));
  }
}
