import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit/cubit/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option/cubit/selectabe_option_cubit.dart';
import 'package:movie_app/presentation/search/widgets/options.dart';
import 'package:movie_app/presentation/search/widgets/search_content.dart';
import 'package:movie_app/presentation/search/widgets/search_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        centerTitle: true,
        title: Text("Search"),
        hideBack: false,
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => SelectabeOptionCubit()),
          BlocProvider(create: (context) => SearchCubit())
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchField(),
                SizedBox(
                  height: 20,
                ),
                Options(),
                SizedBox(
                  height: 20,
                ),
                SearchContent()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
