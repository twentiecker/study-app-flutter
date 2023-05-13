import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_app/configs/themes/app_colors.dart';
import 'package:learning_app/configs/themes/ui_parameters.dart';
import 'package:learning_app/controllers/zoom_drawer_controller.dart';
import 'package:learning_app/screens/login/login_screen.dart';
import '../board/leaderboard_screen.dart';
import '../profile/profile_screen.dart';
import 'home_screen.dart';

// class MyMenuScreen extends StatelessWidget {
class MyMenuScreen extends GetView<MyZoomDrawerController> {
  const MyMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UIParameters.mobileScreenPadding,
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
        data: ThemeData(
            textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(primary: onSurfaceTextColor))),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  right: 0,
                  child: BackButton(
                    color: Colors.white,
                    onPressed: () {
                      controller.toggleDrawer();
                    },
                  )),
              Padding(
                padding: EdgeInsets.only(
                    right: MediaQuery.of(context).size.width * 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => controller.user.value == null
                        ? Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(5)),
                            child: Column(
                              children: [
                                _DrawerButton(
                                  icon: Icons.login,
                                  label: "Sign in",
                                  onPressed: () =>
                                      Get.toNamed(LoginScreen.routeName),
                                ),
                                const SizedBox()
                              ],
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipOval(
                                    child: CachedNetworkImage(
                                  imageUrl: controller.user.value!.photoURL!,
                                )),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  controller.user.value!.displayName ?? '',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                      color: onSurfaceTextColor),
                                ),
                              ],
                            ),
                          )),
                    const Spacer(
                      flex: 1,
                    ),

                    _DrawerButton(
                      icon: Icons.home_outlined,
                      label: "Home",
                      onPressed: () => Get.toNamed(HomeScreen.routeName),
                    ),
                    Obx(() => controller.user.value != null
                        ? _DrawerButton(
                            icon: Icons.person_outline_rounded,
                            label: "Profile",
                            onPressed: () =>
                                Get.toNamed(ProfileScreen.routeName),
                          )
                        : const SizedBox()),
                    _DrawerButton(
                      icon: Icons.leaderboard_outlined,
                      label: "Leaderboard",
                      onPressed: () => Get.toNamed(LeaderboardScreen.routeName),
                    ),
                    _DrawerButton(
                      icon: Icons.web,
                      label: "LMS PPTIK",
                      onPressed: () => controller.website(),
                    ),
                    // _DrawerButton(
                    //   icon: Icons.facebook,
                    //   label: "Facebook",
                    //   onPressed: () => controller.facebook(),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 25),
                    //   child: _DrawerButton(
                    //     icon: Icons.email,
                    //     label: "Email",
                    //     onPressed: () => controller.email(),
                    //   ),
                    // ),
                    const Spacer(
                      flex: 4,
                    ),
                    Obx(() => controller.user.value != null
                        ? _DrawerButton(
                            icon: Icons.logout,
                            label: "Sign out",
                            onPressed: () => controller.signOut())
                        : const SizedBox())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* this is reusable widget only in this class */
class _DrawerButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  const _DrawerButton(
      {Key? key, required this.icon, required this.label, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
        ),
        label: Text(label));
  }
}
