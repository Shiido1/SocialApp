import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/views/widgets/text_views.dart';
import '../../../../core/helper/utils/pallets.dart';

import '../../../core/helper/configs/instances.dart';
import '../../../core/helper/helper_handler.dart';
import '../../../core/helper/utils/pallets.dart';
import '../../../core/helper/utils/strings.dart';
import '../../../core/map/entities/location_result.dart';
import '../../../core/map/place_picker.dart';
import '../../../core/map/widgets/place_picker.dart';
import 'widgets/search.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({Key? key}) : super(key: key);

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: true,
            bottom: AppBar(
                automaticallyImplyLeading: false,
                title: SearchWidget(
                  height: 40,
                  onTap: () => _pickLocationFromMap(),
                )),
          ),
          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              ...[1, 1, 1, 1, 1, 1, 1, 1, 1]
                  .map((_) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16.h),
                            Stack(
                              children: [
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 70.h),
                                    width: Utils.getDeviceWidth(context),
                                    decoration: new BoxDecoration(
                                        color: Pallets.grey,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                faker.image.image()),
                                            fit: BoxFit.cover))),
                                Container(
                                  padding: EdgeInsets.all(10.r),
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    CupertinoIcons.heart,
                                    color: Pallets.white,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 8.h),
                            TextView(
                              text: faker.lorem.sentence(),
                              maxLines: 1,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1,
                            ),
                            SizedBox(height: 8.h),
                            TextView(
                              text: 'Private Room > Paris',
                              maxLines: 1,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.1,
                            ),
                            TextView(
                              text: 'Rated: 4.5 (145 Reviews)',
                              maxLines: 1,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1.1,
                            ),
                          ],
                        ),
                      ))
                  .toList()
            ]),
          ),
        ],
      ),
    );
  }

  LocationResult? _locationResult;

  void _pickLocationFromMap() async {
    LocationResult? _result =
        await Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PlacePicker(
                  AppString.googleMapKey,
                  displayLocation: LatLng(
                      _locationResult?.latLng?.latitude ?? .0,
                      _locationResult?.latLng?.longitude ?? .0),
                )));
    if (_result != null) {
      _locationResult = _result;
    }
    log.d(_locationResult?.formattedAddress);
    setState(() {});
  }
}
