import 'package:flutter/material.dart';
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
        PopupMenuButton(
            // add icon, by default "3 dot" icon
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text("Favourite page"),
                ),
                const PopupMenuItem<int>(
                  value: 1,
                  child: Text("History page"),
                ),
                const PopupMenuItem<int>(
                  value: 2,
                  child: Text("Logout"),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => favourite()),
                  );
                }
              } else if (value == 1) {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => History()),
                  );
                }
              } else if (value == 2) {
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Started()),
                  );
                }
              }
            }),
      ],
    );
  }
}
