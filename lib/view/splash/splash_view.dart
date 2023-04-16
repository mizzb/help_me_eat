import 'package:feed_me/config/constants.dart';
import 'package:feed_me/view/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lottie/lottie.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SizedBox(
        child: Center(child: Lottie.asset(kSplashLottie),),
      ),
    );
  }
}
