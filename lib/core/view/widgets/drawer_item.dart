import 'package:flutter/material.dart';
import 'package:news_app/core/utils/routes/routes.dart';
import 'package:news_app/core/utils/themes/dark_theme.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.ontap,
    required this.icon,
    required this.isActive,
  });

  final String title;
  final String subtitle;
  final VoidCallback ontap;
  final IconData icon;
  final bool isActive;

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool highlighted = widget.isActive || isHovered;

    return InkWell(
      onTap: widget.ontap,
      onHover: (value) {
        setState(() {
          isHovered = value;
        });
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: highlighted
              ? [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    spreadRadius: 2,
                    color: AppDarkColors.orangeColor.withOpacity(
                      widget.isActive ? 0.6 : 0.25,
                    ),
                  ),
                ]
              : [],

          borderRadius: BorderRadius.all(Radius.circular(16.0)),

          color: widget.isActive
              ? AppDarkColors.orangeColor
              : isHovered
              ? AppDarkColors.orangeColor.withOpacity(0.15)
              : AppDarkColors.blackColor.withOpacity(0.4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                height: 40.0,
                width: 40.0,

                decoration: BoxDecoration(
                  color: widget.isActive
                      ? AppDarkColors.orangeColor.withOpacity(0.6)
                      : AppDarkColors.blackColor.withOpacity(0.6),
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
                ),

                child: Icon(
                  widget.icon,
                  color: widget.isActive
                      ? AppDarkColors.black2Color
                      : AppDarkColors.whiteColor,
                  size: 25.0,
                ),
              ),

              SizedBox(width: 10.0),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    widget.title,
                    style: TextTheme.of(context).bodySmall!.copyWith(
                      color: widget.isActive
                          ? AppDarkColors.black2Color
                          : AppDarkColors.whiteColor,
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    widget.subtitle,
                    style: TextTheme.of(context).titleMedium!.copyWith(
                      color: widget.isActive
                          ? AppDarkColors.black2Color
                          : AppDarkColors.whiteColor,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
