import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/themes/custom_text_styles.dart';
import 'package:learning_app/configs/themes/ui_parameters.dart';
import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../model/user_model.dart';

class LeaderboardCard extends StatelessWidget {
  final UserModel model;
  final int index;

  const LeaderboardCard({Key? key, required this.model, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double padding = 10.0;
    return Container(
      decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: Theme.of(context).cardColor),
      child: InkWell(
        onTap: () {
          // controller.navigateToQuestions(paper: model);
          // print('${model.title}');
        },
        child: Padding(
          padding: const EdgeInsets.all(padding),
          child: Stack(
            /* make it full to the edge */
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: ColoredBox(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      child: SizedBox(
                        height: Get.width * 0.15,
                        width: Get.width * 0.15,
                        child: CachedNetworkImage(
                          /* to access image url from firebase storage */
                          imageUrl: model.profilepic ??
                              "https://ui-avatars.com/api/?name=${model.name.replaceAll(" ", "+")}&background=random",
                          placeholder: (context, url) => Container(
                            alignment: Alignment.center,
                            child: const CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              Image.asset("assets/images/app_splash_logo.png"),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name,
                          style: cardTitles(context),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 15),
                          child: Text(model.email),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                  right: -1,
                  top: 3,
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  bottom: -padding,
                  right: -padding,
                  child: GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cardBorderRadius),
                              bottomRight: Radius.circular(cardBorderRadius)),
                          color: Theme.of(context).primaryColor),
                      child: Row(
                        children: [
                          const Icon(AppIcons.trophyOutline),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            model.listTest[model.listTest.length - 1].points,
                            style: const TextStyle(color: onSurfaceTextColor),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
