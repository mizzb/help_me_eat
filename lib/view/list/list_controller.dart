import 'package:feed_me/config/constants.dart';
import 'package:feed_me/view/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ListController extends GetxController {
  late final String type;
  late List _list;

  @override
  Future<void> onInit() async {
    super.onInit();
    type = Get.find<HomeController>().prefer.value;
  }

  Widget generateList() {
    switch (type) {
      case 'Restaurant':
        _list = Get.find<HomeController>().restaurantList;
        break;
      case 'Cafe':
        _list = Get.find<HomeController>().cafeList;
        break;
      case 'Pub or Party Place':
        _list = Get.find<HomeController>().pubList;
        break;
    }

    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () async {
                if (_list[index].zomatoLink != null) {
                  if (await canLaunchUrl(Uri.parse(_list[index].zomatoLink))) {
                    await launchUrl(Uri.parse(_list[index].zomatoLink));
                    throw Exception('Could not launch');
                  }
                }
              },
              leading: (_list[index].rating != null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.star,
                          color: kSelected,
                        ),
                        Text(_list[index].rating!),
                      ],
                    )
                  : null,
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _list[index].name!,
                    style: GoogleFonts.caveat(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  if (_list[index].location != null) ...[
                    Text(
                      _list[index].location!,
                      style: GoogleFonts.caveat(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    if (_list[index].cuisine != null) const Divider()
                  ]
                ],
              ),
              subtitle: (_list[index].cuisine != null)
                  ? Text(
                      _list[index].cuisine!,
                      style: GoogleFonts.caveat(fontSize: 16),
                    )
                  : (_list[index].menu != null)
                      ? Text(
                          _list[index].menu,
                          style: GoogleFonts.caveat(fontSize: 16),
                        )
                      : (_list[index].menuType != null)
                          ? Text(
                              _list[index].menuType,
                              style: GoogleFonts.caveat(fontSize: 16),
                            )
                          : null,
              trailing: (_list[index].priceRange != null)
                  ? Text(_list[index].priceRange!)
                  : null,
            ),
          );
        });
  }
}
