import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/utils/constants.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';
import 'package:news_app/core/view/widgets/appbar_button.dart';
import 'package:news_app/features/home/models/news_api_response.dart';

class ArticleDetails extends StatelessWidget {
  const ArticleDetails({super.key, required this.article});

  final Article? article;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final parsedDate = DateFormat(
      'yyyy-MM-dd – kk:mm',
    ).format(DateTime.parse(article!.publishedAt.toString()));

    return Scaffold(
      backgroundColor: AppDarkColors.blackColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: article?.urlToImage ?? AppConstants.placeholderImg,
              fit: BoxFit.cover,
              width: double.infinity,
              height: size.height * 0.5,
            ),
            Positioned(
              top: size.height * 0.06,
              left: 8,
              right: 8,
              child: SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarButton(
                      iconData: Icons.arrow_back_ios_new_outlined,
                      hasPaddingBetween: true,
                      onTap: () => Navigator.pop(context),
                    ),
                    Row(
                      children: [
                        AppBarButton(
                          iconData: Icons.favorite_border,
                          hasPaddingBetween: true,
                          onTap: () {},
                        ),
                        const SizedBox(width: 8),
                        AppBarButton(
                          iconData: Icons.share,
                          hasPaddingBetween: true,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.5),
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  color: AppDarkColors.blackColor,
                  boxShadow: [BoxShadow(blurRadius: 30.0, spreadRadius: 30.0)],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 12.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 12),

                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: AppDarkColors.orangeColor,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Text(
                          softWrap: true,
                          '${article?.content}',
                          style: TextTheme.of(context).titleLarge!.copyWith(
                            letterSpacing: 2.0,
                            height: 2,
                            color: AppDarkColors.greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),

                      SizedBox(height: 16.0),
                      Text(
                        'Related',
                        style: TextTheme.of(context).titleLarge!.copyWith(
                          letterSpacing: 2.0,
                          height: 2,
                          color: AppDarkColors.whiteColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: size.height * 0.2, left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      color: AppDarkColors.orangeColor,
                    ),
                    child: Center(
                      child: Text(
                        '${article?.source?.name}',
                        style: TextTheme.of(context).titleLarge!.copyWith(
                          color: AppDarkColors.black2Color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10.0),

                  Text(
                    '${article?.title}',
                    style: TextTheme.of(context).titleLarge!.copyWith(
                      color: AppDarkColors.whiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                          article?.urlToImage ?? AppConstants.placeholderImg,
                        ),
                      ),
                      const SizedBox(width: 15.0),

                      Text(
                        '${article?.author}  | $parsedDate',
                        style: TextTheme.of(context).titleSmall!.copyWith(
                          color: AppDarkColors.greyColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
