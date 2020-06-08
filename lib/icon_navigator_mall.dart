library flutter_mall;

import 'package:flutter/material.dart';

const double kMinHorizontalSpacing = 10;

class IconNavigatorItem {
  String imageUrl;
  VoidCallback action;

  IconNavigatorItem({this.imageUrl, this.action});
}

class IconNavigatorMall extends StatelessWidget {
  final List<IconNavigatorItem> itemList;
  final double width;
  final double itemSize;
  final double minHorizontalSpacing;
  final double horizontalPadding;
  final double verticalSpacing;
  final int maxItemsEachRow;

  IconNavigatorMall({
    Key key,
    @required this.itemList,
    @required this.itemSize,
    this.width,
    double minHorizontalSpacing = kMinHorizontalSpacing,
    this.verticalSpacing = 5,
    this.maxItemsEachRow,
    this.horizontalPadding = 10,
  })  : assert(itemList != null),
        assert(horizontalPadding != null),
        assert(itemSize != null),
        assert(maxItemsEachRow == null || maxItemsEachRow > 0),
        this.minHorizontalSpacing =
            _computeMinHorizontalSpacing(minHorizontalSpacing),
        super(key: key);

  static double _computeMinHorizontalSpacing(double minHorizontalSpacing) {
    return minHorizontalSpacing == null
        ? kMinHorizontalSpacing
        : minHorizontalSpacing < kMinHorizontalSpacing
            ? kMinHorizontalSpacing
            : minHorizontalSpacing;
  }


}
