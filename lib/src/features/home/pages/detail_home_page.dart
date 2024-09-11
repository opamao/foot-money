import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';

import '../../../../constants/constants.dart';
import '../../../themes/themes.dart';
import '../../../widgets/widgets.dart';
import '../home.dart';

class DetailHomePage extends StatefulWidget {
  const DetailHomePage({super.key});

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

enum LegendShape { circle, rectangle }

class _DetailHomePageState extends State<DetailHomePage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final dataMap = <String, double>{
    "Seko": 5,
    "Fofana": 3,
    "Isaac": 2,
    "Molare": 2,
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
  ];

  String selected = "";
  String label = "";
  bool isButtonSelected = false;

  Widget customRadio(String titre, String index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          if (selected == index) {
            selected = "";
            label = "";
            isButtonSelected = false;
          } else if (!isButtonSelected) {
            selected = index;
            label = titre;
            isButtonSelected = true;
          }
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: (selected == index) ? Colors.transparent : appOrange,
        foregroundColor: appOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        side: BorderSide(
          color: (selected == index) ? appOrange : Colors.transparent,
          width: 2.0,
        ),
      ),
      child: Text(
        titre.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
          color: (selected == index) ? appOrange : appWhite,
          fontSize: 8.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/ligue.png",
                    height: 25,
                    width: 25,
                  ),
                  Gap(2.w),
                  Text(
                    "Ligue 1 - Journée 1",
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
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
              Gap(4.h),
              PieChart(
                dataMap: dataMap,
                animationDuration: const Duration(milliseconds: 800),
                chartLegendSpacing: 32,
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                colorList: colorList,
                initialAngleInDegree: 0,
                chartType: ChartType.ring,
                ringStrokeWidth: 32,
                centerText: "Votes",
                legendOptions: const LegendOptions(
                  showLegendsInRow: false,
                  legendPosition: LegendPosition.right,
                  showLegends: true,
                  legendShape: BoxShape.circle,
                  legendTextStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: true,
                  showChartValues: true,
                  showChartValuesInPercentage: false,
                  showChartValuesOutside: true,
                  decimalPlaces: 1,
                ),
              ),
              Gap(4.h),
              SubmitButton(
                AppConstants.btnDons,
                onPressed: () => showBarModalBottomSheet(
                  expand: true,
                  context: context,
                  barrierColor: appColor,
                  builder: (context) => const DonsPage(),
                ),
              ),
              Gap(2.h),
              TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(text: "Africa"),
                  Tab(text: "Olympique"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => showBarModalBottomSheet(
                            expand: true,
                            context: context,
                            barrierColor: appColor,
                            builder: (context) => const DetalJoueurPage(),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: appColor.withOpacity(.12),
                              border: Border.all(
                                color: appColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Coulibaly \nSimon",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: appBlack,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Gap(1.h),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    "assets/images/joueur.png",
                                    height: 138,
                                    width: 90,
                                  ),
                                ),
                                Gap(1.h),
                                customRadio(
                                  "Homme du match",
                                  "$index",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                        childAspectRatio: 0.6,
                      ),
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: appColor.withOpacity(.12),
                            border: Border.all(
                              color: appColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Coulibaly \nSimon",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(1.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  "assets/images/joueur.png",
                                  height: 138,
                                  width: 90,
                                ),
                              ),
                              Gap(1.h),
                              customRadio(
                                "Homme du match",
                                "$index",
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
