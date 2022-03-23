import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/helper/utils/images.dart';
import 'package:social_app/views/widgets/image_loader.dart';
import 'package:social_app/views/widgets/text_views.dart';

import '../../../../core/helper/utils/pallets.dart';
import '../../../../core/helper/utils/validators.dart';
import '../../../widgets/body_widget.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/edit_form_widget.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  State<AddPhotoScreen> createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context),
      resizeToAvoidBottomInset: false,
      body: BodyWidget(
          child: Stack(
        children: [
          ListView(
            children: [
              TextView(
                text: 'Add Photo',
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 24.h),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ImageLoader(
                        height: 147.h,
                        width: 147.w,
                        path: AppImages.userProfile),
                    SizedBox(height: 13.h),
                    ButtonWidget(
                        width: 163.w,
                        buttonStyle: true,
                        primary: Pallets.grey10,
                        borderColor: Pallets.grey10,
                        buttonText: 'Upload an Image',
                        color: Color(0xffB2B7C2),
                        onPressed: () {})
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonWidget(
                buttonStyle: true,
                primary: _returnValid() ? Pallets.primary100 : Pallets.grey10,
                borderColor:
                    _returnValid() ? Pallets.primary100 : Pallets.grey10,
                buttonText: 'Continue',
                color: _returnValid() ? Pallets.white : Color(0xffB2B7C2),
                onPressed: () {}),
          )
        ],
      )),
    );
  }

  bool _returnValid() {
    return true;
  }
}
