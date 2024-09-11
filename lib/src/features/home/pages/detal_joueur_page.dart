import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';

class DetalJoueurPage extends StatefulWidget {
  const DetalJoueurPage({super.key});

  @override
  State<DetalJoueurPage> createState() => _DetalJoueurPageState();
}

class _DetalJoueurPageState extends State<DetalJoueurPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
                    "Ligue 1",
                    style: TextStyle(
                      color: appBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Gap(2.h),
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    "assets/images/joueur.png",
                    height: 76,
                    width: 50,
                  ),
                ),
                title: Text(
                  "Coulibaly Simon",
                  style: TextStyle(
                    color: appBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Age: 27 (11.10.1997)",
                  style: TextStyle(
                    color: appSub,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                leading: Image.asset(
                  "assets/images/africa.png",
                  height: 46,
                  width: 50,
                ),
                title: Text(
                  "Africa Sport",
                  style: TextStyle(
                    color: appBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Contrat 21.12.2028",
                  style: TextStyle(
                    color: appSub,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  "Défenseur",
                  style: TextStyle(
                    color: appSub,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(),
              TabBar(
                controller: _tabController,
                tabs: const <Widget>[
                  Tab(text: "Matchs"),
                  Tab(text: "Carrière"),
                  Tab(text: "Transferts"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            "06.09\n2024",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: appSub,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Row(
                            children: [
                              Image.asset(
                                "assets/images/africa.png",
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                "Africa Sport",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Image.asset(
                                "assets/images/olympique.png",
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                "Olympique",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "2\n0",
                                style: TextStyle(
                                  color: appRed,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(2.w),
                              Container(
                                padding: EdgeInsets.all(2.w),
                                decoration: BoxDecoration(
                                  color: appColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  "V",
                                  style: TextStyle(
                                    color: appWhite,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            "2023\n2024",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: appSub,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Row(
                            children: [
                              Image.asset(
                                "assets/images/africa.png",
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                "Africa Sport",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            "3e",
                            style: TextStyle(
                              color: appRed,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            "06.09\n2024",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: appSub,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Row(
                            children: [
                              Image.asset(
                                "assets/images/olympique.png",
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                "Olympique",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "Transfert (15M)",
                            style: TextStyle(
                              color: appSub,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                "assets/images/africa.png",
                                height: 20,
                                width: 20,
                              ),
                              Text(
                                "Africa Sport",
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
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
