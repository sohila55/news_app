import 'package:flutter/material.dart';
import 'package:news_app/core/utils/routes/routes.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';
import 'package:news_app/core/view/widgets/drawer_item.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Drawer(
      backgroundColor: AppDarkColors.deepNavyBlack,
      elevation: 0.0,
      width: 300,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),

            Text(
              'Pulse News',
              style: TextTheme.of(context).headlineMedium!.copyWith(
                color: AppDarkColors.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),

            Divider(
              color: AppDarkColors.greyColor,
              endIndent: 5.0,
              indent: 5.0,
            ),
            SizedBox(height: 20.0),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: DrawerItem(
                    icon: Icons.home,
                    isActive: selectedIndex == 0,
                    ontap: () {
                      Navigator.of(context).pushNamed(AppRoutes.home);
                    },
                    title: 'Home',
                    subtitle: 'Your daily Feed',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: DrawerItem(
                    icon: Icons.explore_rounded,
                    isActive: selectedIndex == 1,
                    ontap: () {
                      Navigator.of(context).pushNamed(AppRoutes.search);
                    },
                    title: 'Search',
                    subtitle: 'Discover by topic',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: DrawerItem(
                    icon: Icons.star_rate_sharp,
                    isActive: selectedIndex == 2,
                    ontap: () {},
                    title: 'Ai Assistant',
                    subtitle: 'Ask & Summurize',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: DrawerItem(
                    icon: Icons.person,
                    isActive: selectedIndex == 3,
                    ontap: () {},
                    title: 'Profile',
                    subtitle: 'Profile & Saved',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
