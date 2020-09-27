import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashBoardSlider extends StatelessWidget {
  const DashBoardSlider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        Container(
          margin: EdgeInsets.all(0.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage("assets/logo.jpg"),
                fit: BoxFit.fitHeight,
              )),
          child: InkWell(
            onTap: () {},
          ),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://s3.india.com/wp-content/uploads/2018/04/assam_police.jpg"),
                fit: BoxFit.cover,
              )),
        ),
        Container(
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage(
                    "https://cache.careers360.mobi/media/presets/860X430/article_images/2020/7/17/assam-police-recruitment.jpg"),
                fit: BoxFit.cover,
              )),
        ),
      ],
      options: CarouselOptions(
        height: 180.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 1000),
        viewportFraction: 0.9,
      ),
    );
  }
}
