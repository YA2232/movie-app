import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:movie_app/core/config/assets/vectors/app_vectors.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movie_widget.dart';
import 'package:movie_app/presentation/home/widgets/popular_movie_widget.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BasicAppbar(
          centerTitle: true,
          title: SvgPicture.asset(
            AppVectors.logo,
            width: 100,
          ),
          action: IconButton(
              onPressed: () {
                context.push("/search");
              },
              icon: const Icon(Icons.search)),
          hideBack: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CategoryText(
                text: 'Popular',
              ),
              const PopularMovieWidget(),
              const SizedBox(
                height: 16,
              ),
              CategoryText(
                text: 'Now Playing',
              ),
              const SizedBox(
                height: 16,
              ),
              const NowPlayingMovieWedgit(),
              const SizedBox(
                height: 16,
              ),
              CategoryText(
                text: 'Popular Tv',
              ),
              const SizedBox(
                height: 16,
              ),
              const PopularTvWidget(),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ));
  }
}
