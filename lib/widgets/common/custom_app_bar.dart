import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/themes/custom_text_styles.dart';
import 'package:learning_app/screens/question/questions_overview_screen.dart';

import '../../configs/themes/app_icons.dart';
import '../../configs/themes/ui_parameters.dart';
import '../app_circle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  const CustomAppBar({
    Key? key,
    this.title = '',
    this.titleWidget,
    this.leading,
    this.showActionIcon = false,
    this.onMenuActionTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(mobileScreenPadding),
      child: Stack(
        children: [
          Positioned.fill(
              child: titleWidget == null
                  ? Center(
                      child: Text(
                        title,
                        style: appBarText,
                      ),
                    )
                  : Center(
                      child: titleWidget,
                    )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(
                      offset: Offset(-14, 0), child: BackButton()),
              if (showActionIcon)
                Transform.translate(
                  offset: Offset(10, 0),
                  child: AppCircleButton(
                    child: Icon(AppIcons.menu),
                    onTap: onMenuActionTap ??
                        () => Get.toNamed(QuestionsOverviewScreen.routeName),
                  ),
                )
            ],
          )
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 80);
}
