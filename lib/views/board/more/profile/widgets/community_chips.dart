import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/utils/pallets.dart';
import '../../../../widgets/text_views.dart';

class CommunityChips extends StatelessWidget {
  const CommunityChips({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<int> _index = [1, 2, 3, 4, 5];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Divider(color: Pallets.grey),
        SizedBox(height: 16.h),
        TextView(
            text: 'Communities', fontSize: 14, fontWeight: FontWeight.w500),
        SizedBox(height: 4.h),
        Wrap(
            spacing: 10,
            children: List<Widget>.generate(
              _index.length + 1,
              (int idx) {
                // if (idx == _index.length) {
                //   return Chip(
                //       padding: EdgeInsets.only(right: 10.w),
                //       labelPadding: EdgeInsets.zero,
                //       deleteIconColor: Pallets.mildGrey,
                //       avatar: Icon(Icons.add),
                //       label: TextView(
                //           text: 'Add',
                //           fontSize: 12,
                //           fontWeight: FontWeight.w300));
                // }
                return Chip(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: .0),
                    labelPadding: EdgeInsets.zero,
                    // onDeleted: () {},
                    // deleteIconColor: Pallets.mildGrey,
                    label: TextView(
                        text: 'Gay: $idx',
                        fontSize: 12,
                        fontWeight: FontWeight.w300));
              },
            ).toList()),
      ],
    );
    ;
  }
}
