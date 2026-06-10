import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/routes/routes.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';
import 'package:news_app/core/view/widgets/app_drawer.dart';
import 'package:news_app/features/search/cubit/search_cubit.dart';
import 'package:news_app/features/search/views/widgets/initial_search_page_content.dart';
import 'package:news_app/features/search/views/widgets/search_result_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    return BlocProvider(
      create: (context) {
        final cubit = SearchCubit();

        return cubit;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(AppRoutes.home);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppDarkColors.orangeColor,
            ),
          ),

          backgroundColor: AppDarkColors.blackColor,
          elevation: 0.0,
        ),
        drawer: AppDrawer(),
        backgroundColor: AppDarkColors.blackColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              // vertical: 16.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Explore',
                  style: TextTheme.of(
                    context,
                  ).headlineMedium!.copyWith(color: AppDarkColors.whiteColor),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Discover what the world is reading',
                  style: TextTheme.of(
                    context,
                  ).titleLarge!.copyWith(color: AppDarkColors.grey2Color),
                ),
                SizedBox(height: 20.0),
                TextField(
                  style: TextTheme.of(
                    context,
                  ).bodyMedium!.copyWith(color: AppDarkColors.whiteColor),
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: AppDarkColors.greyColor),
                    ),
                    fillColor: AppDarkColors.deepNavyBlack,
                    filled: true,

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide(color: AppDarkColors.orangeColor),
                    ),
                    focusColor: AppDarkColors.orangeColor,
                    errorBorder: OutlineInputBorder(
                      // borderSide: BorderSide(color: AppDarkColors.red),
                    ),
                    hint: Text(
                      'Search Topic , authors,sources..',
                      style: TextTheme.of(
                        context,
                      ).bodyMedium!.copyWith(color: AppDarkColors.greyColor),
                      maxLines: 1,
                    ),
                    suffixIcon: BlocBuilder<SearchCubit, SearchState>(
                      bloc: searchCubit,
                      buildWhen: (previous, current) =>
                          current is SearchLoading ||
                          current is SearchLoaded ||
                          current is SearchError,
                      builder: (context, state) {
                        if (state is SearchLoading) {
                          return InkWell(
                            onTap: null,
                            child: Icon(
                              Icons.find_in_page_sharp,
                              color: AppDarkColors.greyColor,
                            ),
                          );
                        }
                        return InkWell(
                          onTap: () async => await searchCubit.getSearchResults(
                            _searchController.text,
                          ),
                          child: Icon(
                            Icons.find_in_page_sharp,
                            color: AppDarkColors.orangeColor,
                          ),
                        );
                      },
                    ),
                  ),
                  cursorColor: AppDarkColors.orangeColor,
                ),
                SizedBox(height: 16.0),

                BlocBuilder<SearchCubit, SearchState>(
                  bloc: searchCubit,
                  buildWhen: (previous, current) =>
                      current is SearchLoading ||
                      current is SearchLoaded ||
                      current is SearchError,
                  builder: (context, state) {
                    if (state is SearchLoading) {
                      return Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: AppDarkColors.greyColor,
                        ),
                      );
                    } else if (state is SearchLoaded) {
                      if (state.articles.isEmpty) {
                        return Text(
                          'No Results match',
                          style: TextTheme.of(
                            context,
                          ).bodyLarge!.copyWith(color: AppDarkColors.greyColor),
                        );
                      }

                      return Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            final article = state.articles[index];
                            return SearchResultItem(article: article);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 30.0);
                          },
                          itemCount: state.articles.length,
                        ),
                      );
                    } else if (state is SearchError) {
                      return Text(state.error);
                    } else {
                      return InitialSearchPageContent();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
