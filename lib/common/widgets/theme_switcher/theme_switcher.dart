import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/theme/app_color.dart';
import 'package:movie_app/core/theme_cubit/cubit/theme_cubit.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, state) {
        final isDark = state == ThemeMode.dark;
        return Switch(
          activeColor: AppColor.primary,
          inactiveTrackColor: AppColor.primary,
          inactiveThumbColor: Colors.white,
          activeTrackColor: AppColor.secondaryBackGround,
          value: isDark,
          onChanged: (value) => context.read<ThemeCubit>().toggleTheme(value),
        );
      },
    );
  }
}
