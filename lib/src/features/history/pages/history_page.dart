import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';
import '../history.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              GestureDetector(
                onTap: () => showBarModalBottomSheet(
                  expand: true,
                  context: context,
                  barrierColor: appColor,
                  builder: (context) => const DetailHistoryPage(),
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/ligue.png",
                              height: 25,
                              width: 25,
                            ),
                            Text(
                              "Ligue 1 - J1",
                              style: TextStyle(
                                color: appBlack,
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                            ),
                            const Spacer(),
                            Container(
                              padding: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                color: appCard,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "+15 Vote(s)",
                                style: TextStyle(
                                  color: appBlack,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(2.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Africa ",
                              style: TextStyle(
                                color: appBlack,
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ),
                            ),
                            Image.asset(
                              "assets/images/africa.png",
                              height: 25,
                              width: 25,
                            ),
                            Gap(2.w),
                            Column(
                              children: [
                                Text(
                                  "15:00",
                                  style: TextStyle(
                                    color: appBlack,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "2 : 0",
                                  style: TextStyle(
                                    color: appRed,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "Terminé",
                                  style: TextStyle(
                                    color: appColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Gap(2.w),
                            Image.asset(
                              "assets/images/olympique.png",
                              height: 25,
                              width: 25,
                            ),
                            Text(
                              " Olympique",
                              style: TextStyle(
                                color: appBlack,
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
