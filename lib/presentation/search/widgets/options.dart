import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option/cubit/selectabe_option_cubit.dart';
import 'package:movie_app/presentation/search/widgets/selectable_option.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectabeOptionCubit, SearchType>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SelectableOption(
                title: "Movie",
                isSelected: context.read<SelectabeOptionCubit>().state ==
                    SearchType.movie,
                opTap: () {
                  context.read<SelectabeOptionCubit>().selectMovie();
                }),
            SizedBox(
              width: 15,
            ),
            SelectableOption(
                title: "TV",
                isSelected:
                    context.read<SelectabeOptionCubit>().state == SearchType.tv,
                opTap: () {
                  context.read<SelectabeOptionCubit>().selectTv();
                }),
          ],
        );
      },
    );
  }
}
