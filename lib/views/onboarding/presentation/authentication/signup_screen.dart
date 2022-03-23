import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_app/core/helper/routes/navigation.dart';
import 'package:social_app/core/helper/utils/pallets.dart';
import 'package:social_app/core/helper/utils/validators.dart';
import 'package:social_app/views/onboarding/presentation/authentication/connect_community.dart';
import 'package:social_app/views/widgets/body_widget.dart';
import 'package:social_app/views/widgets/buttons.dart';
import 'package:social_app/views/widgets/default_appbar.dart';
import 'package:social_app/views/widgets/edit_form_widget.dart';
import 'package:social_app/views/widgets/text_views.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: 'Sign up', centerTitle: true),
      body: BodyWidget(
          child: Stack(
        children: [
          ListView(
            children: [
              EditFormField(
                label: 'Email or Username',
                validator: Validators.validateEmail(),
                controller: _emailController,
                onChange: (_) {
                  _returnValid();
                },
              ),
              SizedBox(height: 32.h),
              ButtonWidget(
                  buttonStyle: true,
                  primary: _returnValid() ? Pallets.primary100 : Pallets.grey10,
                  borderColor:
                      _returnValid() ? Pallets.primary100 : Pallets.grey10,
                  buttonText: 'Continue',
                  color: _returnValid() ? Pallets.white : Color(0xffB2B7C2),
                  onPressed: () =>
                      PageRouter.gotoWidget(ConnectCommunityScreen(), context))
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'By continuing, you agree to our ',
                style: GoogleFonts.poppins(
                    color: Pallets.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 10.sp),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Terms of Service ',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp),
                  ),
                  TextSpan(
                    text: 'and acknowledge that you have read our ',
                    style: GoogleFonts.poppins(
                        color: Pallets.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 10.sp),
                  ),
                  TextSpan(
                    text: 'Privacy Policy ',
                    style: GoogleFonts.poppins(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 10.sp),
                  ),
                  TextSpan(
                    text: 'to learn how we collect use,\nand share your data.',
                    style: GoogleFonts.poppins(
                        color: Pallets.grey,
                        fontWeight: FontWeight.w300,
                        fontSize: 10.sp),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  bool _returnValid() {
    return _emailController.text.isEmpty;
  }
}
