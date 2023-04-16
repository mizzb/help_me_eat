import 'package:feed_me/config/constants.dart';
import 'package:feed_me/view/home/home_binding.dart';
import 'package:feed_me/view/home/home_view.dart';
import 'package:feed_me/view/list/list_binding.dart';
import 'package:feed_me/view/list/list_view.dart';
import 'package:feed_me/view/splash/splash_binding.dart';
import 'package:feed_me/view/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> getPages() => [
      GetPage(
          name: kRouteSplash, page: SplashView.new, binding: SplashBinding()),
      GetPage(name: kRouteHome, page: HomeView.new, binding: HomeBinding()),
      GetPage(name: kRouteList, page: ListScreen.new, binding: ListBinding()),
    ];
