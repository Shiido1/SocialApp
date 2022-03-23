import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/helper/helper_handler.dart';
import 'package:social_app/core/helper/utils/images.dart';
import 'package:social_app/views/onboarding/presentation/authentication/login_intro.dart';
import 'package:social_app/views/widgets/body_widget.dart';
import 'package:social_app/views/widgets/default_appbar.dart';
import 'package:social_app/views/widgets/text_views.dart';

import '../../../../core/helper/routes/navigation.dart';
import '../../../../core/helper/utils/pallets.dart';
import '../../../widgets/buttons.dart';
import 'signup_screen.dart';

class SignupScreenIntro extends StatelessWidget {
  const SignupScreenIntro({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context,
          leadingWidget: IconButton(onPressed: () {}, icon: Icon(Icons.clear))),
      body: Stack(
        children: [
          BodyWidget(
              child: ListView(
            children: [
              SizedBox(height: 54.12.h),
              TextView(
                text: 'Sign up to Kondo',
                textAlign: TextAlign.center,
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.h),
              TextView(
                text: 'Manage your account, notifications, messages and more.',
                textAlign: TextAlign.center,
                fontSize: 12.sp,
                color: Color(0xff959CAB),
                fontWeight: FontWeight.w300,
              ),
              SizedBox(height: 48.h),
              ButtonWidget(
                  buttonStyle: true,
                  icon: AppImages.user,
                  borderColor: Pallets.buttonBorder,
                  color: Pallets.black,
                  primary: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  buttonText: 'Email or Username',
                  onPressed: () =>
                      PageRouter.gotoWidget(SignupScreen(), context)),
              SizedBox(height: 16.h),
              ButtonWidget(
                  buttonStyle: true,
                  icon: AppImages.google,
                  borderColor: Pallets.buttonBorder,
                  color: Pallets.black,
                  primary: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  buttonText: 'Continue with Google',
                  onPressed: () => null)
            ],
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50.h,
              width: Utils.getDeviceWidth(context),
              padding: EdgeInsets.all(16.w),
              color: Color(0xffFAFAFB),
              child: Center(
                  child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextView(
                    text: 'Already have an account? ',
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  TextView(
                    text: 'Login in',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.deepPurple,
                    onTap: () =>
                        PageRouter.gotoWidget(LoginScreenIntro(), context),
                  )
                ],
              )),
            ),
          )
        ],
      ),
    );
  }
}
