import 'package:feed_me/config/constants.dart';
import 'package:feed_me/view/home/home_controller.dart';
import 'package:feed_me/view/widgets/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          child: Obx(() => Stack(
                children: [
                  if (controller.showLoad.isFalse) ...[
                    _topLottieWidget(),
                    _mainView(),
                  ],
                  if (controller.showLoad.isTrue) ...[
                    _showLoader(),
                  ],
                ],
              )),
        ),
      ),
    );
  }

  Widget _mainView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 25.h,
          ),
          Container(
            color: Colors.white,
            child: Obx(() {
              return Column(
                children: [
                  const Divider(),
                  _locationWidget(),
                  SizedBox(height: 2.h),
                  ..._options(),
                  SizedBox(height: 2.h),
                  _searchButton(),
                  SizedBox(height: 2.h),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  SizedBox _topLottieWidget() {
    return SizedBox(
      height: 25.h,
      width: 100.w,
      child: Row(
        children: [
          Lottie.asset(kHomeLottie),
          Text(
            kHomeQuestion,
            style:
                GoogleFonts.caveat(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Row _locationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'You wanna search in ',
          style: GoogleFonts.caveat(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 30.w,
          child: TextField(
            controller: controller.locationTextController,
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kHighlight),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kHighlight),
              ),
            ),
            style:
                GoogleFonts.caveat(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  List<Widget> _options() {
    return [
      SelectionCard(
        headerText: 'Your budget',
        contentList: kBudget,
        callBack: controller.onBudgetClick,
        selectedVal: controller.budget.value,
      ),
      SizedBox(height: 1.h),
      SelectionCard(
        headerText: 'Your prefer',
        contentList: kType,
        callBack: controller.onPreferClick,
        selectedVal: controller.prefer.value,
      ),
      if (controller.prefer == kType[1]['data']) SizedBox(height: 1.h),
      if (controller.prefer == kType[1]['data'])
        SelectionCard(
          headerText: 'Interested cuisine',
          contentList: kCuisine,
          callBack: controller.onCuisineClick,
          selectedVal: controller.cuisine.value,
        ),
      if (controller.prefer != kType[2]['data']) SizedBox(height: 1.h),
      if (controller.prefer != kType[2]['data'])
        SelectionCard(
          headerText: 'You are going with',
          contentList: kGroup,
          callBack: controller.onGoingClick,
          selectedVal: controller.going.value,
        ),
    ];
  }

  GestureDetector _searchButton() {
    return GestureDetector(
      onTap: () {
        controller.onSearchClick();
      },
      child: Card(
        child: Container(
          width: 100.w,
          height: 8.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kHighlight,
          ),
          child: Center(
              child: Text(
            "Lets Search",
            style:
                GoogleFonts.caveat(fontWeight: FontWeight.bold, fontSize: 20),
          )),
        ),
      ),
    );
  }

  _showLoader() {
    return Flexible(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Lottie.asset(kLoadingLottie)),
          Text(
            'Powered by ChatGPT & @mizh_b',
            style: GoogleFonts.caveat(fontWeight: FontWeight.w500, color: kHighlight),
          )
        ],
      ),
    );
  }
}
