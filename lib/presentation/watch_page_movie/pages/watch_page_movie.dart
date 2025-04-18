import 'package:flutter/material.dart';
import 'package:movie_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/presentation/watch_page_movie/widgets/recommendation_widget.dart';
import 'package:movie_app/presentation/watch_page_movie/widgets/video_over_view.dart';
import 'package:movie_app/presentation/watch_page_movie/widgets/video_player_widget.dart';
import 'package:movie_app/presentation/watch_page_movie/widgets/video_release_data_widget.dart';
import 'package:movie_app/presentation/watch_page_movie/widgets/video_title_widget.dart';
import 'package:movie_app/presentation/watch_page_movie/widgets/video_voate_widget.dart';

class WatchPage extends StatelessWidget {
  final MovieEntity movieEntity;
  WatchPage({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: false,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VideoPlayerWidget(
              id: movieEntity.id,
            ),
            SizedBox(
              height: 20,
            ),
            VideoTitleWidget(title: movieEntity.title),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VideoReleaseDataWidget(releaseDate: movieEntity.releaseDate),
                VideoVoateWidget(voateAvreage: movieEntity.voteAverage)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "OverView",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            VideoOverView(overView: movieEntity.overview),
            SizedBox(
              height: 15,
            ),
            Text(
              "Recommendations",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            RecommendationWidget(id: movieEntity.id)
          ],
        ),
      ),
    );
  }
}
