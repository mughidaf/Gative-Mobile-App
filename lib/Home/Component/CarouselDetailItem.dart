import 'package:flutter/material.dart';

class CarouselDetailItem extends StatefulWidget {
  const CarouselDetailItem({
    Key? key,
  }) : super(key: key);

  @override
  State<CarouselDetailItem> createState() => _CarouselDetailItemState();
}

class _CarouselDetailItemState extends State<CarouselDetailItem> {
  late PageController _pageController;

  List<String> images = [
    "assets/slide/banner1.jpg",
    "assets/slide/banner1.jpg",
    "assets/slide/banner1.jpg",
  ];

  int activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 200,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage)
        )
      ],
    );
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 10 : 20;

  return AnimatedContainer(
    duration: Duration(milliseconds: 500),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(images[pagePosition]))),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      print(pagePosition);

      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: EdgeInsets.all(10),
      child: Image.asset(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: EdgeInsets.all(3),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
          color: currentIndex == index ? Color(0xFFFFFDFD) : Color(0xFF333333),
          shape: BoxShape.circle),
    );
  });
}
