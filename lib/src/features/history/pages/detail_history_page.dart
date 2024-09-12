import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';

class DetailHistoryPage extends StatefulWidget {
  const DetailHistoryPage({super.key});

  @override
  State<DetailHistoryPage> createState() => _DetailHistoryPageState();
}

class _DetailHistoryPageState extends State<DetailHistoryPage> {

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
            ],
          ),
        ),
      ),
    );
  }
}
