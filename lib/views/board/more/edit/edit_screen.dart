import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/helper/utils/pallets.dart';
import 'package:social_app/views/widgets/body_widget.dart';
import 'package:social_app/views/widgets/buttons.dart';
import 'package:social_app/views/widgets/edit_form_widget.dart';
import 'package:social_app/views/widgets/text_views.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

List language = ['Hausa', 'Yoruba', 'Dutch', 'English', 'Fulani'];

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyWidget(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 55,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: EditFormField(
                    label: 'Firstname',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
                SizedBox(
                  width: 45.w,
                ),
                Expanded(
                  child: EditFormField(
                    label: 'Lastname',
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            EditFormField(
              height: 113,
              label: 'Bio',
              floatingLabelBehavior: FloatingLabelBehavior.auto,
            ),
            SizedBox(
              height: 25,
            ),
            TextView(
              text: 'Language',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20,
            ),
            ...language.map((e) => TextView(text: e)).toList(),
            SizedBox(
              height: 20.h,
            ),
            TextView(
              text: 'Verification',
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 10.h,
            ),
            ButtonWidget(buttonText: 'Verify Identity', onPressed: () {})
          ],
        ),
      )),
    );
  }
}
