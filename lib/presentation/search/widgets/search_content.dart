import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/common/widgets/tv/tv_card.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit/cubit/search_cubit.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
      if (state is SearchLoading) {
        return Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (state is SearchMovieLoaded) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return MovieCard(movieEntity: state.listOfMovieEntity[index]);
          },
          itemCount: state.listOfMovieEntity.length,
        );
      } else if (state is SearchTvLoaded) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.6),
          itemBuilder: (context, index) {
            return TvCard(tvEntity: state.listOfTvEntity[index]);
          },
          itemCount: state.listOfTvEntity.length,
        );
      } else if (state is SearchError) {
        return Text(state.errorMessage);
      }
      return Container();
    });
  }
}
