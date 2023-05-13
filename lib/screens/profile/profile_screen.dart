import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

import '../../configs/themes/app_colors.dart';
import '../../configs/themes/app_icons.dart';
import '../../configs/themes/custom_text_styles.dart';
import '../../configs/themes/ui_parameters.dart';
import '../../controllers/zoom_drawer_controller.dart';
import '../../widgets/app_card.dart';
import '../../widgets/app_icon_text.dart';
import '../../widgets/content_area.dart';
import '../home/menu_screen.dart';

class ProfileScreen extends GetView<MyZoomDrawerController> {
  static const String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: 50,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.DefaultStyle,
          backgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width * 0.6,
          controller: _.zoomDrawerController,
          menuScreen: const MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: controller.toggleDrawer,
                          child: const Icon(AppIcons.menuLeft),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                AppIcons.peace,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('User Detail Information',
                                  style: detailText.copyWith(
                                      color: onSurfaceTextColor))
                            ],
                          ),
                        ),
                        const Text(
                          'Profile',
                          style: headerText,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: ClipOval(
                            child: CachedNetworkImage(
                          imageUrl: controller.user.value!.photoURL!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.contain,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  width: 5, color: onSurfaceTextColor),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(() => SizedBox(
                              width: double.maxFinite,
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  AppCard(
                                    height: Get.height * 0.08,
                                    width: Get.width * 0.8,
                                    child: AppIconText(
                                      icon: Icon(
                                        Icons.person_outline_rounded,
                                        color: Theme.of(context).primaryColor,
                                        size: 35,
                                      ),
                                      text: Text(
                                        controller.user.value!.displayName!,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      width: 35,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  AppCard(
                                    height: Get.height * 0.08,
                                    width: Get.width * 0.8,
                                    child: AppIconText(
                                      icon: Icon(
                                        Icons.alternate_email_rounded,
                                        color: Theme.of(context).primaryColor,
                                        size: 35,
                                      ),
                                      text: Text(
                                        controller.user.value!.email!,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      width: 35,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
