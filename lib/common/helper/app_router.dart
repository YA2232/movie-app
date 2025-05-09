import 'package:go_router/go_router.dart';
import 'package:movie_app/common/widgets/custom_transition/custom_transition.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';
import 'package:movie_app/presentation/home/pages/home_page.dart';
import 'package:movie_app/presentation/search/pages/search_page.dart';
import 'package:movie_app/presentation/watch_page_movie/pages/watch_page_movie.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: "/search",
        pageBuilder: (context, state) =>
            CustomTransition.customTransitionPage(SearchPage()),
      ),
      GoRoute(
          path: '/watch_page',
          pageBuilder: (context, state) {
            final param = state.extra as MovieEntity;
            return CustomTransition.customTransitionPage(
                WatchPage(movieEntity: param));
          }),
    ],
  );
}
