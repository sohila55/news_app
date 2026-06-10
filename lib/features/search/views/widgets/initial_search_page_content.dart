import 'package:flutter/material.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';

class InitialSearchPageContent extends StatelessWidget {
  const InitialSearchPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingNews = [
      "AI",
      "Technology",
      "Flutter",
      "Sports",
      "Business",
      "Politics",
      "Science",
    ];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tranding Tags',
          style: TextTheme.of(
            context,
          ).bodyLarge!.copyWith(color: AppDarkColors.whiteColor),
        ),

        SizedBox(height: 20.0),

        Wrap(
          spacing: 16.0,
          runSpacing: 12.0,

          children: trendingNews
              .map(
                (e) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppDarkColors.deepNavyBlack,
                      border: Border.all(color: AppDarkColors.greyColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '# $e',
                      style: TextTheme.of(
                        context,
                      ).bodyMedium!.copyWith(color: AppDarkColors.whiteColor),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }
}
