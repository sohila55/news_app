import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/core/utils/routes/routes.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';
import 'package:news_app/features/home/models/top_headlines_api_response.dart';

class RecommendedNews extends StatelessWidget {
  const RecommendedNews({super.key, required this.articles});
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: articles.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 16.0),
      itemBuilder: (context, index) {
        final article = articles[index];
        final parsedDate = DateFormat(
          'yyyy-MM-dd – kk:mm',
        ).format(DateTime.parse(article.publishedAt.toString()));

        return InkWell(
          onTap: () {
            Navigator.of(
              context,
            ).pushNamed(AppRoutes.article_details, arguments: article);
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(
                  article.urlToImage ?? AppConstants.placeholderImg,
                ),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: AppDarkColors.black2Color,
                    ),
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${article.source?.name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextTheme.of(context).labelLarge!.copyWith(
                              color: AppDarkColors.orangeColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),

                          Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            '${article.title}',
                            style: TextTheme.of(context).labelLarge!.copyWith(
                              color: AppDarkColors.whiteColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${article.description}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextTheme.of(context).labelLarge!.copyWith(
                              color: AppDarkColors.greyColor,
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),

                          Text(
                            '${article.source?.name}   | $parsedDate',

                            style: TextTheme.of(context).labelLarge!.copyWith(
                              color: AppDarkColors.whiteColor,
                              fontSize: 10.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
