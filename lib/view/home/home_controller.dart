import 'dart:convert';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:feed_me/config/constants.dart';
import 'package:feed_me/config/utils.dart';
import 'package:feed_me/model/cafe.dart';
import 'package:feed_me/model/pub.dart';
import 'package:feed_me/model/restaurant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController locationTextController = TextEditingController();

  OpenAI? _openAI;
  final Utils _utils = Utils();
  String searchText = '';

  RxString location = ''.obs;
  RxString budget = ''.obs;
  RxString prefer = ''.obs;
  RxString cuisine = ''.obs;
  RxString going = ''.obs;
  RxBool showLoad = true.obs;
  List<Cafe> cafeList = [];
  List<Restaurant> restaurantList = [];
  List<Pub> pubList = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    _openAI = OpenAI.instance.build(
        token: kChatGtpKey,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 200)));
    location(Get.arguments['location']);
    locationTextController.text = location.value;
    showLoad(false);
  }

  Future<void> onBudgetClick(String selBudget) async {
    budget(selBudget);
    update();
  }

  void onPreferClick(String selPrefer) {
    prefer(selPrefer);
    if (prefer == kType[1]['data']) {
      cuisine('');
    }
    update();
  }

  void onCuisineClick(String selCuisine) {
    cuisine(selCuisine);
    update();
  }

  void onGoingClick(String selGoing) {
    going(selGoing);
    update();
  }

  void onSearchClick() {
    if (budget.value != '' &&
        locationTextController.text.isNotEmpty &&
        locationTextController.text != ' ' &&
        prefer.value != '') {
      if (prefer.value == 'Restaurant' && cuisine.value == '') {
        _utils.showSnack(title: 'Hey!', subTitle: kCuisineMissing);
      } else if (prefer.value != 'Pub or Party Place' && going.value == '') {
        _utils.showSnack(title: 'Hey!', subTitle: kGoingMissing);
      } else {
        try {
          switch (prefer.value) {
            case 'Cafe':
              searchText = "Suggest me 5 ${budget.value} ${prefer.value} in "
                  "${locationTextController.text} for ${going.value} $kResponsePrompt";
              break;
            case 'Restaurant':
              searchText = "Suggest me 5 ${budget.value} ${cuisine.value} "
                  "${prefer.value} in ${locationTextController.text} "
                  "for ${going.value} $kResponsePrompt";
              break;
            case 'Pub or Party Place':
              searchText = "Suggest me 5 ${budget.value} ${prefer.value} "
                  "in ${locationTextController.text} $kResponsePrompt";
              break;
          }
          askGPT(searchText);
        } catch (e) {
          _utils.showSnack(title: 'Oops!', subTitle: kSomethingWrong);
        }
      }
    } else {
      _utils.showSnack(title: 'Hey!', subTitle: kSurpriseMessage);
    }
  }

  void askGPT(String searchText) async {
    try {
      showLoad(true);
      final request = ChatCompleteText(messages: [
        Map.of({"role": "user", "content": searchText})
      ], maxToken: 1000, model: ChatModel.ChatGptTurboModel);
      final response = await _openAI!.onChatCompletion(request: request);
      final restaurants = jsonDecode(response!.choices[0].message.content);
      restaurantList.clear();
      cafeList.clear();
      pubList.clear();

      switch (prefer.value) {
        case 'Restaurant':
          restaurants.forEach((key, value) {
            restaurantList.add(Restaurant.fromJson(value));
          });
          break;
        case 'Cafe':
          restaurants.forEach((key, value) {
            cafeList.add(Cafe.fromJson(value));
          });
          break;
        case 'Pub or Party Place':
          restaurants.forEach((value) {
            pubList.add(Pub.fromJson(value));
          });
          break;
      }
      showLoad(false);
      if (restaurantList.isNotEmpty ||
          cafeList.isNotEmpty ||
          pubList.isNotEmpty) {
        Get.toNamed(kRouteList);
      } else {
        _utils.showSnack(
          title: "Oops!",
          subTitle: "We cant find any restaurants :(",
        );
      }
    } catch (e) {
      _utils.showSnack(
        title: "Oops!",
        subTitle: "GPT is not responding can you try again!",
      );
      showLoad(false);
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
