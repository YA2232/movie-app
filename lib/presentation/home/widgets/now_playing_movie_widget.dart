import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/home/bloc/now_playing/cubit/now_playing_cubit.dart';

class NowPlayingMovieWedgit extends StatelessWidget {
  const NowPlayingMovieWedgit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
          builder: (context, state) {
        if (state is NowPlayingLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is NowPlayingLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return MovieCard(movieEntity: state.nowPlayingList[index]);
              },
              separatorBuilder: (ccontext, index) => SizedBox(
                width: 10,
              ),
              itemCount: state.nowPlayingList.length,
            ),
          );
        } else if (state is NowPlayingError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
