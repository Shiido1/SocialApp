import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/helper/routes/navigation.dart';
import '../../core/helper/utils/pallets.dart';
import 'text_views.dart';

AppBar defaultAppBar(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeading = true,
    bool showMoreMenu = false,
    bool centerTitle = false,
    double? elevation = 0,
    double? leadingWidth = .0,
    Widget? leadingWidget,
    Color? backgroundColor,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? titleWidgte,
    bool? showClearButton = true,
    String image = ''}) {
  return AppBar(
    automaticallyImplyLeading: showLeading,
    elevation: elevation,
    centerTitle: centerTitle,
    bottom: bottom,
    // leadingWidth: leadingWidth?.w,
    backgroundColor: Pallets.white,
    leading: showLeading
        ? leadingWidget ??
            IconButton(
                onPressed: () => PageRouter.goBack(context),
                icon: Icon(
                    Platform.isIOS ? Icons.navigate_before : Icons.arrow_back))
        : null,
    iconTheme: IconThemeData(color: Pallets.grey900),
    title: titleWidgte ??
        TextView(
            text: title,
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Pallets.grey900,
            textAlign: TextAlign.center),
    actions: actions,
  );
}

AppBar defaultAppBar2(BuildContext context,
    {String title = '',
    VoidCallback? onTap,
    bool showLeading = true,
    bool showMoreMenu = false,
    bool centerTitle = false,
    double? elevation,
    double? leadingWidth = 70,
    Widget? leadingWidget,
    Color? backgroundColor,
    Color? textColor,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    Widget? titleWidgte,
    bool? showClearButton = true,
    Widget? flexibleSpace,
    String image = ''}) {
  return AppBar(
    automaticallyImplyLeading: showLeading,
    elevation: elevation,
    centerTitle: centerTitle,
    bottom: bottom,
    flexibleSpace: flexibleSpace,
    leadingWidth: leadingWidth?.w,
    leading: leadingWidget,
    backgroundColor: backgroundColor,
    iconTheme: IconThemeData(color: Pallets.white),
    title: titleWidgte ??
        TextView(
            text: title,
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: textColor ?? Theme.of(context).colorScheme.primary,
            textAlign: TextAlign.center),
    actions: actions,
  );
}
