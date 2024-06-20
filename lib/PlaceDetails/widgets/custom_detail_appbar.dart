import 'package:flutter/material.dart';
import 'package:pharonic/core/widgets/more_options.dart';
import 'package:pharonic/favorites/favourite.dart';
import 'package:pharonic/history.dart';
import 'package:pharonic/started.dart';

class CustomDetailAppbar extends StatelessWidget {
  const CustomDetailAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left,
            size: 32,
            color: Colors.white,
          ),
        ),
        Text(
          "Pharonic Scanning",
          style: TextStyle(
            fontFamily: 'oxanium',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        MoreOptions(),
      ],
    );
  }
}
