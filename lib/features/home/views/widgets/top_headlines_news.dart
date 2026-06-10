import 'package:flutter/material.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';
import 'package:news_app/features/home/models/news_api_response.dart';

class TopHeadlinesNews extends StatelessWidget {
  const TopHeadlinesNews({
    super.key,
    required this.articles,
    required this.ontap,
  });

  final List<Article>? articles;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: ontap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: AppDarkColors.deepNavyBlack,
              shape: BoxShape.rectangle,
              border: Border.all(color: AppDarkColors.greyColor, width: 1.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text.rich(
                TextSpan(
                  text: '# $index ',
                  style: const TextStyle(
                    color: AppDarkColors.orangeColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: articles![index].title!
                          .split(' ')
                          .take(2)
                          .join(' '),
                      style: const TextStyle(
                        color: AppDarkColors.whiteColor,
                        fontSize: 14.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(width: 10.0);
      },
      itemCount: 10,
      scrollDirection: Axis.horizontal,
    );
  }
}
