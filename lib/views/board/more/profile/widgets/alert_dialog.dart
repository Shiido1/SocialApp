import 'package:flutter/material.dart';
import 'package:social_app/core/helper/routes/navigation.dart';
import 'package:social_app/core/helper/utils/validators.dart';
import 'package:social_app/views/widgets/edit_form_widget.dart';
import 'package:social_app/views/widgets/text_views.dart';

import '../../../../../core/helper/utils/pallets.dart';


TextEditingController _textFieldController = TextEditingController();
Future<void> displayTextInputDialog(BuildContext context,
    {required String? title, required Function(String? value)? value}) async {
  final _key = GlobalKey<FormState>();
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Form(
          key: _key,
          child: AlertDialog(
            title: TextView(
              text: title ?? '',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Pallets.mildGrey,
              maxLines: 1,
            ),
            content: EditFormField(
                autoFocus: true,
                controller: _textFieldController,
                validator: Validators.validateString()),
            actions: <Widget>[
              TextView(
                text: 'Save',
                fontWeight: FontWeight.w400,
                color: Colors.green[600],
                maxLines: 1,
                onTap: () {
                  if (_key.currentState!.validate()) {
                    value!(_textFieldController.text);
                    PageRouter.goBack(context);
                  }
                },
              )
            ],
          ),
        );
      });
}

String? codeDialog;
String? valueText;
