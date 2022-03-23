import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/views/onboarding/presentation/authentication/add_photo.dart';
import 'package:social_app/views/widgets/text_views.dart';

import '../../../../core/helper/routes/navigation.dart';
import '../../../../core/helper/utils/pallets.dart';
import '../../../../core/helper/utils/validators.dart';
import '../../../widgets/body_widget.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/edit_form_widget.dart';
import 'connect_community.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
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
                text: 'Get started with  basic info',
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 24.h),
              EditFormField(
                label: 'First name',
                validator: Validators.validateString(),
                controller: null,
                onChange: (_) {
                  _returnValid();
                },
              ),
              SizedBox(height: 16.h),
              EditFormField(
                label: 'Last name',
                validator: Validators.validateString(),
                controller: null,
                onChange: (_) {
                  _returnValid();
                },
              ),
              SizedBox(height: 16.h),
              EditFormField(
                label: 'Date of birth',
                validator: Validators.validateString(),
                controller: null,
                readOnly: true,
                onTapped: () {},
                suffixIcon: Icons.keyboard_arrow_down,
                onChange: (_) {
                  _returnValid();
                },
              ),
              SizedBox(height: 16.h),
              EditFormField(
                label: 'Password',
                validator: Validators.validateString(),
                controller: null,
                onChange: (_) {
                  _returnValid();
                },
              ),
              SizedBox(height: 16.h),
              EditFormField(
                label: 'Confirm Password',
                validator: Validators.validateString(),
                controller: null,
                onChange: (_) {
                  _returnValid();
                },
              ),
              SizedBox(height: 32.h),
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
                onPressed: () =>
                    PageRouter.gotoWidget(AddPhotoScreen(), context)),
          )
        ],
      )),
    );
  }

  bool _returnValid() {
    return true;
  }
}
