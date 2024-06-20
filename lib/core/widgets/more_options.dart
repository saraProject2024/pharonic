import 'package:flutter/material.dart';
import 'package:pharonic/auth.dart';
import 'package:pharonic/favorites/favourite.dart';
import 'package:pharonic/history.dart';
import 'package:pharonic/started.dart';

class MoreOptions extends StatelessWidget {
  const MoreOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        // add icon, by default "3 dot" icon
        // icon: Icon(Icons.book)
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
    }, onSelected: (value) {
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
          Auth().signOut();

          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Started()),
            );
          }
        }
      }
    });
  }
}
