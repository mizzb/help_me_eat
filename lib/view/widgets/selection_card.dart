import 'package:feed_me/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SelectionCard extends StatelessWidget {
  final String headerText;
  final List contentList;
  final String selectedVal;
  final Function callBack;

  const SelectionCard({
    super.key,
    required this.headerText,
    required this.contentList,
    required this.callBack,
    required this.selectedVal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.h,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headerText,
            style:
                GoogleFonts.caveat(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
            child: Center(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: contentList.length,
                  itemBuilder: (ctxt, index) {
                    return GestureDetector(
                      onTap: () => callBack(contentList[index]['data']),
                      child: Card(
                          color: (selectedVal == contentList[index]['data'])
                              ? kSelected
                              : Colors.white,
                          child: Container(
                            width: 30.w,
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              contentList[index]['text'],
                              style: GoogleFonts.caveat(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )),
                          )),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
