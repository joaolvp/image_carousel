import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teste_carrossel/pages/full_screen_image.dart';

class ImageCarouselPage extends StatefulWidget {
  const ImageCarouselPage({super.key});

  @override
  State<ImageCarouselPage> createState() => _ImageCarouselPageState();
}

class _ImageCarouselPageState extends State<ImageCarouselPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> list = [
      'assets/images/image1.webp',
      'assets/images/image2.jpeg',
      'assets/images/image3.jpeg',
      'assets/images/image4.jpeg',
      'assets/images/image5.webp'
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: CarouselSlider(
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.5,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              items: list.map((path) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            border: Border.all(width: 2)),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          FullScreenImagePage(path: path)));
                            },
                            child: Image.asset(path)));
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AnimatedSmoothIndicator(
            activeIndex: currentIndex,
            count: list.length,
            effect: ExpandingDotsEffect(
                dotColor: Colors.grey.shade500, activeDotColor: Colors.black),
          )
        ],
      ),
    );
  }
}
