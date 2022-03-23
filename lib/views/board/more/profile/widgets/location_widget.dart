import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/utils/pallets.dart';
import '../../../../widgets/text_views.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(color: Pallets.grey),
        SizedBox(height: 10.h),
        Row(
          children: [
            Icon(
              CupertinoIcons.map_pin_ellipse,
              color: Pallets.mildGrey,
            ),
            SizedBox(width: 8.w),
            Expanded(
                child: TextView(
              text: 'Barcelona, Spain',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ))
          ],
        ),
        SizedBox(height: 4.h),
        Row(
          children: [
            TextView(
              text: 'Spoken Language:',
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
            SizedBox(width: 8.w),
            Expanded(
                child: TextView(
              text: 'English',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ))
          ],
        ),
      ],
    );
  }
}
