import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/helper/utils/images.dart';
import '../../core/helper/utils/pallets.dart';

class ImageBgCard extends StatelessWidget {
  final Widget? child;
  const ImageBgCard(this.child, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Pallets.primary100,
          borderRadius: BorderRadius.circular(5.r),
          image: new DecorationImage(
              fit: BoxFit.cover, image: new AssetImage(AppImages.logo))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: child,
      ),
    );
  }
}
