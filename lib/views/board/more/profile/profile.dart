import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/helper/configs/instances.dart';
import 'package:social_app/core/helper/routes/navigation.dart';
import 'package:social_app/core/helper/utils/pallets.dart';
import 'package:social_app/core/map/map_caller.dart';
import 'package:social_app/views/widgets/body_widget.dart';
import 'package:social_app/views/widgets/instagram/web_view.dart';
import 'package:social_app/views/widgets/text_views.dart';

import 'widgets/alert_dialog.dart';
import 'widgets/community_chips.dart';
import 'widgets/icon_widgets.dart';
import 'widgets/listing_widgets.dart';
import 'widgets/location_widget.dart';
import 'widgets/reviews_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 50.h,
                  width: 70.w,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 60.r,
                        backgroundColor: Pallets.black,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Icon(
                          CupertinoIcons.checkmark_seal_fill,
                          color: Colors.blue[500],
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.r),
                          color: Pallets.black),
                      child: TextView(
                          text: 'Message', fontSize: 12, color: Pallets.white),
                    ),
                    SizedBox(width: 10.w),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Platform.isIOS
                            ? CupertinoIcons.share
                            : Icons.share_outlined))
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.h),
            TextView(
              text: faker.person.name(),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            TextView(
              text: '@${faker.person.firstName()}',
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Pallets.mildGrey,
              maxLines: 1,
            ),
            SizedBox(height: 16.h),
            TextView(
              text: 'Bio',
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            TextView(
              text: faker.lorem.sentence(),
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: Pallets.mildGrey,
              maxLines: 3,
              textOverflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 16.h),
            IconWidget(
              copy: () => displayTextInputDialog(context,
                  title: 'Enter Website', value: (String? value) {
                log.d(value);
              }),
              instagram: () => PageRouter.gotoWidget(WebViewExample(), context),
              map: () => CallMap.pickLocationFromMap(context,
                  callback: ((result) => {
                        log.d(
                            '${result?.city?.name ?? ''}, ${result?.country?.name ?? ''}')
                      })),
              edit: () => {},
            ),
            LocationWidget(),
            CommunityChips(),
            ListingWidget(),
            ReviewsWidget()
          ],
        ),
      )),
    );
  }
}
