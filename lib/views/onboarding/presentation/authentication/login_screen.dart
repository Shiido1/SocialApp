import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/helper/utils/pallets.dart';
import 'package:social_app/core/helper/utils/validators.dart';
import 'package:social_app/views/widgets/body_widget.dart';
import 'package:social_app/views/widgets/buttons.dart';
import 'package:social_app/views/widgets/default_appbar.dart';
import 'package:social_app/views/widgets/edit_form_widget.dart';
import 'package:social_app/views/widgets/text_views.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: 'Log in', centerTitle: true),
      body: BodyWidget(
          child: ListView(
        children: [
          EditFormField(
            label: 'Email or Username',
            validator: Validators.validateEmail(),
            controller: _emailController,
            onChange: (_) {
              _returnValid();
            },
          ),
          SizedBox(height: 16.h),
          EditFormField(
            label: 'Password',
            validator: Validators.validateString(),
            controller: _passwordController,
            onChange: (_) {
              _returnValid();
            },
          ),
          SizedBox(height: 16.h),
          TextView(text: 'Forgot Password?', onTap: () {}),
          SizedBox(height: 32.h),
          ButtonWidget(
              buttonStyle: true,
              primary: _returnValid() ? Pallets.primary100 : Pallets.grey10,
              borderColor: _returnValid() ? Pallets.primary100 : Pallets.grey10,
              buttonText: 'Login',
              color: _returnValid() ? Pallets.white : Color(0xffB2B7C2),
              onPressed: () {})
        ],
      )),
    );
  }

  bool _returnValid() {
    return _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty;
  }
}
