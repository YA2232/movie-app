import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/home/bloc/tv_popular/cubit/tv_popular_cubit.dart';

class PopularTvWidget extends StatelessWidget {
  const PopularTvWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TvPopularCubit()..getPopularTv(),
      child: BlocBuilder<TvPopularCubit, TvPopularState>(
          builder: (context, state) {
        if (state is TvPopularLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TvPopularLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return TvCard(tvEntity: state.popularTv[index]);
              },
              separatorBuilder: (ccontext, index) => SizedBox(
                width: 10,
              ),
              itemCount: state.popularTv.length,
            ),
          );
        } else if (state is TvPopularError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
