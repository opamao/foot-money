import 'package:flutter/material.dart';
import 'package:footmoney/src/themes/themes.dart';
import 'package:gap/gap.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

import '../actualite.dart';

class ActualitePage extends StatefulWidget {
  const ActualitePage({super.key});

  @override
  State<ActualitePage> createState() => _ActualitePageState();
}

class _ActualitePageState extends State<ActualitePage> {
  final List<Map<String, String>> newsArticles = [
    {
      "title":
          "Cameroun-Namibie : la Fecafoot dévoile les compos, le staff bloqué",
      "content": "Détails de l'article 1",
      "image": "assets/images/actualite1.jpeg"
    },
    {
      "title": "Sénégal : El-Hadji Diouf réagit aux sifflets",
      "content": "Détails de l'article 2",
      "image": "assets/images/actu2.jpeg"
    },
  ];

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
                  builder: (context) => DetailNewsPage(
                    image: newsArticles[0]["image"]!,
                    titre: newsArticles[0]["title"]!,
                    contenu: newsArticles[0]["content"]!,
                  ),
                ),
                child: Card(
                  elevation: 5,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        child: Image.asset(
                          newsArticles[0]["image"]!,
                          height: 219,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.w),
                        child: Text(
                          newsArticles[0]["title"]!,
                          style: TextStyle(
                            color: appBlack,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(3.h),
              Expanded(
                child: ListView.builder(
                  itemCount: newsArticles.length - 1,
                  itemBuilder: (context, index) {
                    final article = newsArticles[index + 1];
                    return GestureDetector(
                      onTap: () => showBarModalBottomSheet(
                        expand: true,
                        context: context,
                        barrierColor: appColor,
                        builder: (context) => DetailNewsPage(
                          image: article["image"]!,
                          titre: article["title"]!,
                          contenu: article["content"]!,
                        ),
                      ),
                      child: Card(
                        elevation: 5,
                        child: Row(
                          children: [
                            // print('Afficher les détails de ${article["title"]}');
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              child: Image.asset(article["image"]!),
                            ),
                            Gap(2.w),
                            Expanded(
                              child: Text(
                                article["title"]!,
                                style: TextStyle(
                                  color: appBlack,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
