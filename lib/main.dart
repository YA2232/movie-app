import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movie_app/common/helper/app_router.dart';
import 'package:movie_app/core/config/theme/app_theme.dart';
import 'package:movie_app/core/theme_cubit/cubit/theme_cubit.dart';
import 'package:movie_app/service_locator.dart';
import 'package:startapp_sdk/startapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  MobileAds.instance.initialize();
  initDep();
  runApp(BlocProvider(
    create: (context) => ThemeCubit(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
