import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit/cubit/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option/cubit/selectabe_option_cubit.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        context
            .read<SearchCubit>()
            .search(value, context.read<SelectabeOptionCubit>().state);
      },
      decoration: InputDecoration(
        hintText: "search...",
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}
