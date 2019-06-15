import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

import 'package:flutter_mall/swiper_mall.dart';

void main() {
  testWidgets('Test SwiperMall', (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
              body: SwiperMall(
                itemList: <SwiperMallItem>[
                  SwiperMallItem(
                      image:
                      "https://github.com/yczhangsjtu/flutter_mall/blob/master/test/assets/test_image_1.jpg"),
                  SwiperMallItem(
                      image:
                      "https://github.com/yczhangsjtu/flutter_mall/blob/master/test/assets/test_image_2.jpg"),
                ],
                autoplayDelay: 3000,
              )),
        ),
      );
      final imageFinder = find.byType(FadeInImage);
      expect(imageFinder, findsOneWidget);
    });
  });
}
