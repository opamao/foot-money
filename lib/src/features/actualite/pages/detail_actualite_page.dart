import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sizer/sizer.dart';

import '../../../themes/themes.dart';

class DetailActualitePage extends StatefulWidget {
  String? image;
  String? titre;
  String? contenu;

  DetailActualitePage({
    super.key,
    this.image,
    this.titre,
    this.contenu,
  });

  @override
  State<DetailActualitePage> createState() => _DetailActualitePageState();
}

class _DetailActualitePageState extends State<DetailActualitePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.all(Radius.circular(15)),
                child: Image.asset(
                  widget.image!,
                  height: 219,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(2.h),
              Text(
                widget.titre!,
                style: TextStyle(
                  color: appBlack,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Gap(2.h),
              Text(
                widget.contenu!,
                style: TextStyle(
                  color: appBlack,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
