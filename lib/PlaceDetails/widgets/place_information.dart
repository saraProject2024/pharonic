import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pharonic/favorites/favourite.dart';
import 'package:pharonic/history.dart';
import 'package:pharonic/started.dart';

import 'custom_detail_appbar.dart';

class PlaceInformation extends StatelessWidget {
  final String title;
  final String description;
  const PlaceInformation({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomDetailAppbar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'oxanium',
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontFamily: 'oxanium',
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 2,
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
