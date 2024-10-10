import 'dart:convert';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:footmoney/src/themes/themes.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../../../../constants/constants.dart';
import '../../../../models/matchs/list_match_model.dart';
import '../home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<MatchModel>> fetchData() async {
    var url = Uri.parse(ApiUrls.getMatchUrl);

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => MatchModel.fromJson(data)).toList();
    } else {
      throw Exception("Une erreur s'est produite");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            children: [
              EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  //`selectedDate` the new date selected.
                },
                activeColor: appColor,
                dayProps: EasyDayProps(
                  height: 56,
                  dayStructure: DayStructure.dayNumDayStr,
                  todayHighlightStyle: TodayHighlightStyle.withBackground,
                  todayHighlightColor: appOrange,
                ),
              ),
              Gap(3.h),
              FutureBuilder<List<MatchModel>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                      child: Text('Pass de media disponible.'),
                    );
                  } else {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final listMatch = snapshot.data![index];
                          return GestureDetector(
                            onTap: () => showBarModalBottomSheet(
                              expand: true,
                              context: context,
                              barrierColor: appColor,
                              builder: (context) => const DetailHomePage(),
                            ),
                            child: Card(
                              elevation: 2,
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
                                          "Ligue 1 - J${listMatch.journee}",
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
                                    Gap(1.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          listMatch.equipeOne!,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: appBlack,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Image.network(
                                          listMatch.equipeOneLogo!,
                                          height: 25,
                                          width: 25,
                                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress.expectedTotalBytes != null
                                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                        ),
                                        Gap(2.w),
                                        Text(
                                          "15:00",
                                          style: TextStyle(
                                            color: appBlack,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12,
                                          ),
                                        ),
                                        Gap(2.w),
                                        Image.network(
                                          listMatch.equipeTwoLogo!,
                                          height: 25,
                                          width: 25,
                                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                                          loadingBuilder: (context, child, loadingProgress) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress.expectedTotalBytes != null
                                                    ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                    : null,
                                              ),
                                            );
                                          },
                                        ),
                                        Text(
                                          listMatch.equipeTwo!,
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: appBlack,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
