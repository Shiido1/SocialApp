import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:social_app/core/database/session_manager.dart';
import 'package:social_app/views/board/main_board.dart';

import 'core/di/injector.dart';
import 'core/helper/configs/providers.dart';
import 'core/helper/routes/routes.dart';
import 'core/network/app_config.dart';
import 'core/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeCore(environment: Environment.staging);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      designSize: const Size(428, 667),
      builder: () => OverlaySupport.global(
        child: MultiProvider(
          providers: Providers.getProviders,
          child: MaterialApp(
            title: 'GayApp',
            debugShowCheckedModeBanner: false,
            theme: lightThemeData(context),
            darkTheme: darkThemeData(context),
            themeMode: ThemeMode.light,
            routes: Routes.getRoutes,
            home: SessionManager.instance.isLoggedIn
                ? MainBoardScreen()
                : MainBoardScreen(),
          ),
        ),
      ),
    );
  }
}
