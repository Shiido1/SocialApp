import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/helper/utils/pallets.dart';

class IconWidget extends StatelessWidget {
  final Function()? copy;
  final Function()? instagram;
  final Function()? map;
  final Function()? edit;

  const IconWidget(
      {required this.copy,
      required this.instagram,
      required this.map,
      required this.edit,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: IconButton(
            onPressed: copy,
            icon: Icon(
              CupertinoIcons.link,
              color: Pallets.mildGrey,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: instagram,
            icon: Icon(
              CupertinoIcons.camera,
              color: Pallets.mildGrey,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: map,
            icon: Icon(
              CupertinoIcons.map,
              color: Pallets.mildGrey,
            ),
          ),
        ),
        // Expanded(
        //   child: GestureDetector(
        //     onTap: edit,
        //     child: Container(
        //       padding: EdgeInsets.symmetric(vertical: 4.h),
        //       decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(5.r),
        //           color: Pallets.black),
        //       child: TextView(
        //         text: 'Edit Profile',
        //         color: Pallets.white,
        //         fontSize: 12,
        //         textAlign: TextAlign.center,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
    ;
  }
}
