import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/configs/instances.dart';
import '../../../../../core/helper/utils/pallets.dart';
import '../../../../widgets/text_views.dart';

class ReviewsWidget extends StatelessWidget {
  const ReviewsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Divider(color: Pallets.grey),
        SizedBox(height: 16.h),
        TextView(
          text: 'Reviews',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        SizedBox(height: 4.h),
        ...[1, 1, 1]
            .map((_) => Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 20.r, backgroundColor: Pallets.black),
                        SizedBox(width: 10.w),
                        Expanded(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextView(
                                text: faker.person.name(),
                                fontSize: 14,
                                maxLines: 1),
                            TextView(
                              text: '@${faker.person.firstName()}',
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Pallets.mildGrey,
                            ),
                          ],
                        ))
                      ],
                    ),
                    SizedBox(height: 4.h),
                    TextView(
                      text: faker.lorem.sentence(),
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: Pallets.mildGrey,
                      maxLines: 3,
                    ),
                    SizedBox(height: 16.h)
                  ],
                ))
            .toList()
      ],
    );
  }
}
