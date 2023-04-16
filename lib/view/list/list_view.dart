import 'package:feed_me/config/constants.dart';
import 'package:feed_me/view/list/list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListScreen extends GetView<ListController> {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kHighlight,
            title: Text(
              'What we found for you',
              style: GoogleFonts.caveat(fontWeight: FontWeight.bold),
            )),
        body: SafeArea(child: controller.generateList()));
  }
}
