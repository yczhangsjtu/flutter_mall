library flutter_mall;

import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

const double kDefaultSwiperHeight = 333;

class SwiperMallItem {
  String imageUrl;
  VoidCallback action;

  SwiperMallItem({this.imageUrl, this.action});
}

class SwiperMall extends StatelessWidget {
  final List<SwiperMallItem> itemList;
  final double width;
  final double height;
  final int autoplayDelay;

  SwiperMall(
      {Key key,
      @required this.itemList,
      this.width,
      this.height = kDefaultSwiperHeight,
      this.autoplayDelay = kDefaultAutoplayDelayMs})
      : assert(itemList != null),
        assert(height != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Swiper(
      itemCount: itemList.length,
      pagination: SwiperPagination(),
      autoplay: true,
      autoplayDelay: this.autoplayDelay,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            if (itemList[index].action != null) itemList[index].action();
          },
          child: FadeInImage(
              width: this.width ?? MediaQuery.of(context).size.width,
              height: this.height,
              fit: BoxFit.cover,
              placeholder: AssetImage("assets/placeholder-image.png"),
              image: NetworkImage(itemList[index].imageUrl)),
        );
      },
    );
    return child;
  }
}
