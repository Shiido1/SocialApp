import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:social_app/core/helper/configs/instances.dart';
import 'package:social_app/core/helper/helper_handler.dart';
import 'package:social_app/core/helper/utils/pallets.dart';
import 'package:social_app/core/helper/utils/strings.dart';
import 'package:social_app/views/board/explore/widgets/search.dart';
import 'package:social_app/views/widgets/body_widget.dart';
import 'package:social_app/views/widgets/text_views.dart';

import '../../../core/map/entities/location_result.dart';
import '../../../core/map/map_caller.dart';
import '../../../core/map/place_picker.dart';
import '../../../core/map/widgets/place_picker.dart';
import 'hotels.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(
          child: Column(
        children: [
          SearchWidget(
            onTap: () => _pickLocationFromMap(),
          ),
          SizedBox(height: 16.h),
          Expanded(
              child: ListView(
            children: [1, 1, 1, 1, 1, 1, 1]
                .map((_) => GestureDetector(
                      onTap: () {
                        pushNewScreen(context,
                            screen: HotelsScreen(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 25.h),
                        width: Utils.getDeviceWidth(context),
                        margin: EdgeInsets.only(bottom: 23.h),
                        decoration: new BoxDecoration(
                            color: Pallets.grey,
                            borderRadius: BorderRadius.circular(5.r),
                            image: DecorationImage(
                                image: NetworkImage(faker.image.image()),
                                fit: BoxFit.cover)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextView(
                              text: 'Gay Paris',
                              color: Pallets.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 24.sp,
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 3.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(color: Pallets.white)),
                              child: TextView(
                                text: 'Find a place',
                                color: Pallets.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ))
        ],
      )),
    );
  }

  LocationResult? _locationResult;

  void _pickLocationFromMap() async {
    CallMap.pickLocationFromMap(context, callback: ((result) {
      if (result != null) {
        _locationResult = result;
        setState(() {});
      }
    }));

    pushNewScreen(context,
        screen: HotelsScreen(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.cupertino);
  }
}
