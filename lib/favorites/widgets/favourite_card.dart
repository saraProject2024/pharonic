import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/templet.dart';

class FavouriteCard extends StatelessWidget {
  final String placeId;
  final bool isFavorite;

  const FavouriteCard({
    super.key,
    required this.placeId,
    required this.isFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Center(
        child: FillImageCard(
          width: double.infinity,
          heightImage: 100,
          color: Colors.white70,
          imageProvider: const NetworkImage(
              'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-16%20161231.png'),
          description: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Luxor',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Valley of the Kings ',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  color: Colors.black,
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Templet()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
