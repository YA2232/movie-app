import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/presentation/watch_page_movie/bloc/cubit/trailer/trailer_movie_cubit.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatelessWidget {
  final int id;
  VideoPlayerWidget({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrailerMovieCubit()..getTrailerMovie(id),
      child: BlocBuilder<TrailerMovieCubit, TrailerMovieState>(
          builder: (context, state) {
        if (state is TrailerMovieLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is TrailerMovieLoaded) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: YoutubePlayer(
                controller: state.youtubePlayerController,
                showVideoProgressIndicator: true,
                progressIndicatorColor: Colors.amber,
                progressColors: const ProgressBarColors(
                  playedColor: Colors.amber,
                  handleColor: Colors.amberAccent,
                ),
              ),
            ),
          );
        } else if (state is TrailerMovierError) {
          return Container(
            child: Center(
              child: Text(state.errorMessage),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
