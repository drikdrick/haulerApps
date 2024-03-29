import '../../helpers/layout.dart';
import 'order/list_order_home.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imgList = [
    'assets/images/carousel/profits.jpeg',
    'assets/images/carousel/guarantee.jpeg',
    'assets/images/carousel/free.jpeg',
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  child: CarouselSlider(
                    carouselController: _controller,
                    options: CarouselOptions(
                      height: 250,
                      viewportFraction: 1,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(
                          () {
                            _current = index;
                          },
                        );
                      },
                    ),
                    items: imgList
                        .map(
                          (item) => Image.asset(
                            item,
                            fit: BoxFit.cover,
                            width: layoutWidth(context),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _controller.animateToPage(entry.key),
                          child: Container(
                            width: 5.0,
                            height: 5.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(
                                    _current == entry.key ? 1 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              color: Colors.blueGrey,
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 10),
                child: LimitOrder(),
              ),
            )
          ],
        )
      ],
    );
  }
}
