import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/configs/instances.dart';
import '../../../../../core/helper/utils/pallets.dart';
import '../../../../widgets/text_views.dart';

class ListingWidget extends StatelessWidget {
  const ListingWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Divider(color: Pallets.grey),
        SizedBox(height: 16.h),
        TextView(
          text: 'Listings',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 4.h),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [1, 1, 1, 4, 5, 5, 5]
                .map((_) => Container(
                      margin: EdgeInsets.only(right: 10.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 20.h),
                      decoration: BoxDecoration(
                          color: Pallets.grey,
                          borderRadius: BorderRadius.circular(5.r),
                          image: DecorationImage(
                              image: NetworkImage(faker.image.image()),
                              fit: BoxFit.cover)),
                    ))
                .toList(),
          ),
        ),
      ],
    );
    ;
  }
}
