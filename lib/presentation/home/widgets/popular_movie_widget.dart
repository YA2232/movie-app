import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/assets/images/app_images.dart';
import 'package:movie_app/presentation/home/bloc/popular/cubit/popular_cubit.dart';

class PopularMovieWidget extends StatelessWidget {
  const PopularMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PopularCubit()..getPopularMovies(),
      child: BlocBuilder<PopularCubit, PopularState>(builder: (context, state) {
        if (state is PopularLoading) {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is PopularLoaded) {
          List<String> list = state.popular
              .map((item) =>
                  AppImages.movieImagesBasePath + item.posterPath.toString())
              .toList();
          return FanCarouselImageSlider.sliderType1(
            imagesLink: list,
            isAssets: false,
            autoPlay: true,
            sliderHeight: 350,
            showIndicator: false,
          );
        } else if (state is PopularError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
