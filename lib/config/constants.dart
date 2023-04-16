import 'package:flutter/material.dart';

const String kAppName = 'Feed Me';
const kChatGtpKey = ''; ////todo : add api key

/// ROUTES ///
const String kRouteSplash = '/splash';
const String kRouteHome = '/home';
const String kRouteList = '/list';
const String kRouteHistory = '/history';

/// THEMING ///
const Color kBackground = Color.fromRGBO(247, 251, 252, 1);
const Color kHighlight = Color.fromRGBO(254, 122, 84, 1);
const Color kSelected = Color.fromRGBO(146, 155, 98, 1);

/// LOTTIE ///
const String kSplashLottie = 'assets/lottie/splash_lottie.json';
const String kHomeLottie = 'assets/lottie/home_lottie.json';
const String kLoadingLottie = 'assets/lottie/loading_lottie.json';

/// Texts ///
const String kHomeQuestion = 'Confused where to eat?';
const String kSurpriseMessage =
    'Please provide us some details OR you can always click \'SURPRISE\' for us to surprise you !';
const String kSomethingWrong = 'Something went wrong!';
const String kGoingMissing = 'You forgot to say whom you are going with';
const String kCuisineMissing = 'Select the cuisine you want to try out';

const String kResponsePrompt = 'in JSON format containing Name, Price, Location, Cuisine Rating and Zomato link';

List<Map> kBudget = [
  {'data': 'Affordable', 'text': 'Affordable'},
  {'data': 'Moderately Affordable', 'text': 'Moderate'},
  {'data': 'Expensive', 'text': 'Expensive'},
];

List<Map> kCuisine = [
  {'data': 'South Indian Cuisine', 'text': 'S. Indian'},
  {'data': 'North Indian Cuisine', 'text': 'N. Indian'},
  {'data': 'Tibetan Cuisine', 'text': 'Tibetan'},
  {'data': 'Chinese Cuisine', 'text': 'Chinese'},
  {'data': 'Thai Cuisine', 'text': 'Thai'},
  {'data': 'Turkish Cuisine', 'text': 'Turkish'},
  {'data': 'Italian Cuisine', 'text': 'Italian'},
  {'data': 'Japanese Cuisine', 'text': 'Japanese'},
  {'data': 'French Cuisine', 'text': 'French'},
];

List<Map> kType = [
  {'data': 'Cafe', 'text': 'Cafe'},
  {'data': 'Restaurant', 'text': 'Restaurant'},
  {'data': 'Pub or Party Place', 'text': 'Pub, Party'},
];

List<Map> kGroup = [
  {'data': 'Kids', 'text': 'Kids'},
  {'data': 'Family', 'text': 'Family'},
  {'data': 'a Date', 'text': 'Date'},
  {'data': 'Friends', 'text': 'Friends'},
];

Map<String, Map<String, String>> kDummyRestaurants = {
  "restaurant2": {
    "name": "Sri Udupi Park",
    "cuisine": "South Indian",
    "price_range": "₹",
    "location": "HSR Layout",
    "rating": "4.1"
  },
  "restaurant2": {
    "name": "Sri Krishna Sagar",
    "cuisine": "South Indian",
    "price_range": "₹₹",
    "location": "HSR Layout",
    "rating": "4.0"
  },
  "restaurant3": {
    "name": "MTR 1924",
    "cuisine": "South Indian",
    "price_range": "₹₹₹",
    "location": "HSR Layout",
    "rating": "4.2"
  },
  "restaurant4": {
    "name": "Nandhini Deluxe",
    "cuisine": "South Indian",
    "price_range": "₹₹",
    "location": "HSR Layout",
    "rating": "3.9"
  },
  "restaurant5": {
    "name": "Adyar Ananda Bhavan",
    "cuisine": "South Indian",
    "price_range": "₹₹",
    "location": "HSR Layout",
    "rating": "4.1"
  }
};
