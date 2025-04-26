import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

          return CarouselSlider.builder(
            itemCount: list.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: list[index],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              height: 350,
              aspectRatio: 16 / 9,
              viewportFraction: 0.7,
            ),
          );
        } else if (state is PopularError) {
          return Text(state.errorMessage);
        }
        return Container();
      }),
    );
  }
}
