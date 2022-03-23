import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/views/onboarding/presentation/authentication/get_started.dart';
import 'package:social_app/views/widgets/text_views.dart';

import '../../../../core/helper/routes/navigation.dart';
import '../../../../core/helper/utils/pallets.dart';
import '../../../../core/helper/utils/validators.dart';
import '../../../widgets/body_widget.dart';
import '../../../widgets/buttons.dart';
import '../../../widgets/default_appbar.dart';
import '../../../widgets/edit_form_widget.dart';

class ConnectCommunityScreen extends StatefulWidget {
  const ConnectCommunityScreen({Key? key}) : super(key: key);

  @override
  State<ConnectCommunityScreen> createState() => _ConnectCommunityScreenState();
}

class _ConnectCommunityScreenState extends State<ConnectCommunityScreen> {
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
                text: 'Connect with a community and culture.',
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
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
                    PageRouter.gotoWidget(GetStartedScreen(), context)),
          )
        ],
      )),
    );
  }

  bool _returnValid() {
    return true;
  }
}
