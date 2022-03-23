import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/helper/configs/instances.dart';
import 'package:social_app/core/helper/utils/pallets.dart';
import 'package:social_app/views/widgets/buttons.dart';
import 'package:social_app/views/widgets/text_views.dart';

import '../../../widgets/body_widget.dart';

class ProScreen extends StatefulWidget {
  const ProScreen({Key? key}) : super(key: key);

  @override
  State<ProScreen> createState() => _ProScreenState();
}

class _ProScreenState extends State<ProScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(
          child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundImage:
                    NetworkImage('https://picsum.photos/id/237/200/300'),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextView(
                      text: '@shiidogram',
                      fontSize: 16,
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    ButtonWidget(
                      buttonText: 'Edit Profile',
                      onPressed: () {},
                      height: 20,
                      width: 100,
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          textContainerWidget(
              text: faker.jwt.custom(expiresIn: DateTime.now(), payload: {})),
          textContainerWidget(text: 'My Favorites'),
          textContainerWidget(text: 'My Listings'),
          textContainerWidget(text: 'Add Community'),
          textContainerWidget(text: 'Invite Friends'),
          textContainerWidget(text: 'Help Center'),
          textContainerWidget(text: 'Terms'),
          textContainerWidget(text: 'Policy'),
          SizedBox(
            height: 20,
          ),
          ButtonWidget(
            buttonText: 'Logout',
            onPressed: () {},
            height: 30,
            width: 100,
          )
        ]),
      )),
    );
  }

  textContainerWidget({String? text}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          TextView(
            text: text!,
            fontSize: 16.sp,
          ),
          Divider(
            thickness: .6,
            color: Pallets.lightGrey,
          )
        ],
      );
}
