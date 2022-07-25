import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class MoviesUpcomingLoadingSkeleton extends StatelessWidget {
  const MoviesUpcomingLoadingSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: .3,
        autoPlay: false,
        enlargeCenterPage: false,
        disableCenter: false
      ),
      items: _skeletonCarouselItems().map(
        (Skeleton skeleton) => Builder(
          builder: (context) => SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: skeleton,
            ),
          ),
        )
      ).toList()
    );
  }

  List<Skeleton> _skeletonCarouselItems() {
    List<Skeleton> items = [];

    for (var i = 0; i < 5; i++) {
      items.add(
        Skeleton(
          isLoading: true,
          skeleton: const SkeletonAvatar(
            style: SkeletonAvatarStyle(
              height: double.infinity,
              width: double.infinity,
              borderRadius: BorderRadius.all(Radius.circular(8))
            ),
          ),
          themeMode: ThemeMode.dark,
          child: Container(),
        )
      );
    }

    return items;
  }
}