import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/utils/pallets.dart';
import '../../../widgets/text_views.dart';

class SearchWidget extends StatelessWidget {
  final String? hint;
  final Function()? onTap;
  final double? height;
  const SearchWidget({this.hint, this.height = 48, this.onTap, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height!.h,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                Icon(CupertinoIcons.search, color: Colors.black),
                SizedBox(width: 16.w),
                Expanded(
                  child: TextView(
                      text: hint ?? 'Where do you want to go?',
                      color: Pallets.mildGrey100),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
