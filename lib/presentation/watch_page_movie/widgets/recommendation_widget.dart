import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/presentation/watch_page_movie/bloc/cubit/recommendations/recommendations_cubit.dart';

class RecommendationWidget extends StatelessWidget {
  final int id;
  const RecommendationWidget({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecommendationsCubit()..getRecommendations(id),
      child: BlocBuilder<RecommendationsCubit, RecommendationsState>(
          builder: (context, state) {
        if (state is RecommendationsLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is RecommendationsLoaded) {
          return SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return MovieCard(movieEntity: state.recommendations[index]);
              },
              separatorBuilder: (ccontext, index) => SizedBox(
                width: 10,
              ),
              itemCount: state.recommendations.length,
            ),
          );
        } else if (state is RecommendationsError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
