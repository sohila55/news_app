import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';

class BreakingNow extends StatelessWidget {
  const BreakingNow({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.category,
    required this.publishedAt,
    required this.description,
    required this.author,
    required this.ontap,
  });
  final String imageUrl;
  final String title;
  final String category;
  final Object publishedAt;
  final String description;
  final String author;

  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: DecorationImage(
            image: CachedNetworkImageProvider(imageUrl),
            fit: BoxFit.cover,
          ),
        ),

        child: Stack(
          children: [
            Positioned(
              top: 20.0,
              left: 20.0,

              child: Row(
                children: [
                  Container(
                    height: 25.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: AppDarkColors.orangeColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        AppConstants.breaking,
                        style: TextTheme.of(context).bodyMedium!.copyWith(
                          color: AppDarkColors.deepNavyBlack,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),

                  Container(
                    height: 25.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: AppDarkColors.orangeColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        category,
                        style: TextTheme.of(context).bodyMedium!.copyWith(
                          color: AppDarkColors.deepNavyBlack,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: 60.0,
              left: 20.0,
              right: 20.0,
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow
                    .ellipsis, ////// to tell me that there is more in title
                style: TextTheme.of(context).bodyMedium!.copyWith(
                  color: AppDarkColors.whiteColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            Positioned(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
              child: Text(
                'By $author | ${DateFormat('MMM d, y').format(DateTime.parse(publishedAt.toString()))}',
                style: TextTheme.of(context).bodyMedium!.copyWith(
                  color: AppDarkColors.whiteColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
