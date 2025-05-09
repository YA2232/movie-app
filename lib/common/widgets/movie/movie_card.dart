import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart'; // استيراد المكتبة
import 'package:movie_app/core/config/assets/images/app_images.dart';
import 'package:movie_app/core/config/theme/app_color.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/domain/movies/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieCard({required this.movieEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push("/watch_page",
            extra:
                movieEntity); // الانتقال لصفحة المشاهدة مع تمرير الـ movieEntity
      },
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColor.secondaryBackGround
              : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: CachedNetworkImage(
                  width: double.infinity,
                  imageUrl:
                      AppImages.movieImagesBasePath + movieEntity.posterPath,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey.shade300,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                    child: const Icon(Icons.error, color: Colors.red),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieEntity.title,
                      style: const TextStyle(
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        Text(
                          movieEntity.voteAverage.toStringAsFixed(1),
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
