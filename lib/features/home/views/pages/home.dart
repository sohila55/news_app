import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';
import 'package:news_app/core/view/widgets/app_drawer.dart';
import 'package:news_app/core/view/widgets/line_text_buttons.dart';
import 'package:news_app/features/home/cubit/home_cubit.dart';
import 'package:news_app/features/home/views/widgets/breaking_now.dart';
import 'package:news_app/features/home/views/widgets/recommended_news.dart';
import 'package:news_app/features/home/views/widgets/top_headlines_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeCubit();
        homeBloc.getTopHeadLinesData();
        homeBloc.recommendationNewsData();
        return homeBloc;
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(Icons.menu, color: AppDarkColors.orangeColor),
          ),
          backgroundColor: AppDarkColors.deepNavyBlack,
          elevation: 0.0,
        ),
        backgroundColor: AppDarkColors.deepNavyBlack,
        drawer: AppDrawer(),
        body: Builder(
          builder: (context) {
            final homeCubit = BlocProvider.of<HomeCubit>(context);
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,

              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    BlocBuilder<HomeCubit, HomeState>(
                      bloc: homeCubit,
                      buildWhen: (previous, current) =>
                          current is TopHeadLineNewsLoaded ||
                          current is TopHeadLineNewsLoading ||
                          current is TopHeadLineNewsError,
                      builder: (context, state) {
                        if (state is TopHeadLineNewsLoading) {
                          return Center(
                            child: const CircularProgressIndicator.adaptive(),
                          );
                        } else if (state is TopHeadLineNewsLoaded) {
                          return Column(
                            children: [
                              SizedBox(
                                height: 300.0,
                                child: BreakingNow(
                                  imageUrl: state.articles?[0].urlToImage ?? '',
                                  title: state.articles?[0].title ?? '',
                                  category: 'Tech',
                                  author: state.articles?[0].author ?? '',
                                  publishedAt:
                                      state.articles?[0].publishedAt ?? '',

                                  description:
                                      state.articles?[0].description ?? '',
                                  ontap: () {},
                                ),
                              ),
                              SizedBox(height: 16.0),
                              LineTextButtons(
                                left_title: 'Trending Now',
                                right_title: 'Live',
                              ),
                              SizedBox(height: 16.0),

                              SizedBox(
                                height: 50.0,
                                child: TopHeadlinesNews(
                                  articles: state.articles,
                                  ontap: () {},
                                ),
                              ),
                            ],
                          );
                        } else if (state is TopHeadLineNewsError) {
                          return Text(state.errorMessage);
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                    SizedBox(height: 16),
                    LineTextButtons(
                      left_title: 'Recommended News',
                      right_title: 'See All',
                    ),

                    SizedBox(height: 16.0),

                    BlocBuilder(
                      bloc: homeCubit,
                      buildWhen: (previous, current) =>
                          current is RecommendedNewsError ||
                          current is RecommendedNewsLoaded ||
                          current is RecommendedNewsLoading,
                      builder: (context, state) {
                        if (state is RecommendedNewsLoading) {
                          return Center(
                            child: CircularProgressIndicator.adaptive(),
                          );
                        } else if (state is RecommendedNewsLoaded) {
                          return RecommendedNews(
                            articles: state.articles ?? [],
                          );
                        } else if (state is RecommendedNewsError) {
                          return Text(state.message);
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
