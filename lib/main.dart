import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:movie_app/common/helper/app_router.dart';
import 'package:movie_app/common/helper/database/database_helper.dart';
import 'package:movie_app/core/config/theme/app_theme.dart';
import 'package:movie_app/core/shared/shared_pref.dart';
import 'package:movie_app/core/theme_cubit/cubit/theme_cubit.dart';
import 'package:movie_app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  MobileAds.instance.initialize();

  bool? isDarkMode = await SharedPref.getDarkMode();

  initDep();
  await sl<DatabaseHelper>().database;

  runApp(
    BlocProvider(
      create: (context) => ThemeCubit()..toggleTheme(isDarkMode ?? false),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.watch<ThemeCubit>().state;

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: themeMode,
      routerConfig: AppRouter.router,
    );
  }
}
