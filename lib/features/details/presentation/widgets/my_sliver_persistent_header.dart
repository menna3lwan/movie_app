import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/common/widgets/custom_app_bar.dart';

class MySliverPersistentHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return CustomAppBar(
      title: "Details",
      actions: [
        IconButton(
          icon: SvgPicture.asset("assets/icons/Bookmark.svg"),
          onPressed: () {},
        ),
      ],
      leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
    );
  }

  @override
  double get maxExtent => 110;

  @override
  double get minExtent => 110;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
