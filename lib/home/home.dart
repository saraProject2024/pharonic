import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';
import 'package:pharonic/PlaceDetails/place_details.dart';
import 'package:pharonic/models/place_model.dart';
import 'package:pharonic/services/firebase_service.dart';

import '../abu_simple.dart';
import '../favorites/favourite.dart';
import '../grandegyption_museum.dart';
import '../history.dart';
import '../pyramids.dart';
import '../scaninng.dart';
import '../search.dart';
import '../started.dart';
import '../templet.dart';
import 'widgets/trending_places_list.dart';

class Home extends StatefulWidget {
  static const pageId = "home";
  List<PlaceModel> places = [];

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  final firebaseService = FirebaseService();
  bool showSearchMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Pharaonic Scanning",
              style: GoogleFonts.oxanium(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          centerTitle: true,
          actions: [
            PopupMenuButton(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Started()),
                  );
                }
              }
            }),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      extendBodyBehindAppBar: true,
      body: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://raw.githubusercontent.com/Fadysamy55/project/main/3.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),

                      // Add padding around the search bar
                      // Use a Material design search bar
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search...',
                          // Add a clear button to the search bar

                          // Add a search icon or button to the search bar
                          prefixIcon: IconButton(
                            color: Colors.black,
                            icon: const Icon(Icons.search),
                            onPressed: () async {
                              // Perform the search here
                              String? searchText = _searchController.value.text;
                              widget.places = await firebaseService
                                  .searchPlaceByTitle(searchText);

                              setState(() {
                                showSearchMenu = true;
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    "The Great Pyramid of "
                    "Giza",
                    style: GoogleFonts.oxanium(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 218, 165, 32),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Giza Necroplis",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.oxanium(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 90.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Pyramids()),
                            );
                          },
                          child: Text(
                            'Pyramids',
                            style: GoogleFonts.oxanium(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Container(
                        width: 90.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.white,
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Templet()),
                            );
                          },
                          child: Text(
                            'Temple',
                            style: GoogleFonts.oxanium(
                              fontSize: 10.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      " Trending Places..!",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.oxanium(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: TrendingPlacesList(),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    width: 380.0,
                    height: 75.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                    child: AppBar(
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      title: Row(
                        children: [],
                      ),
                      actions: [
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: CircleAvatar(
                                radius: 40.0,
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-15%20174646.png'),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                );
                              },
                            ),
                            Text(
                              'Home',
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 218, 165, 32),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: CircleAvatar(
                                radius: 40.0,
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20215829.png'),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Search()),
                                );
                              },
                            ),
                            Text(
                              'Search',
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: CircleAvatar(
                                radius: 40.0,
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20215802.png'),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scaning()),
                                );
                              },
                            ),
                            Text(
                              'Scan Here',
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Column(
                          children: [
                            IconButton(
                              icon: CircleAvatar(
                                radius: 40.0,
                                backgroundImage: NetworkImage(
                                    'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20203448.png'),
                              ),
                              onPressed: () {
                                print("Profile page");
                              },
                            ),
                            Text(
                              'Profile',
                              style: TextStyle(
                                fontSize: 7.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
        LayoutBuilder(builder: (context, _) {
          if (showSearchMenu) {
            return GestureDetector(
              onTap: () {
                log('tapped');
                setState(() {
                  showSearchMenu = false;
                });
              },
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.transparent,
              ),
            );
          } else {
            return Container(
              width: 0,
              height: 0,
            );
          }
        }),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (showSearchMenu) {
              return Padding(
                padding: const EdgeInsets.only(
                  top: 182,
                  left: 14,
                  right: 14,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: SearchResultList(widget: widget),
                ),
              );
            } else {
              return Container(
                width: 0,
                height: 0,
              );
            }
          },
        )
      ]),
    );
  }
}

class SearchResultList extends StatelessWidget {
  const SearchResultList({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: widget.places.length,
      itemBuilder: (context, idx) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (
                  context,
                ) =>
                    PlaceDetailView(place: widget.places[idx]),
              ),
            );
          },
          child: Container(
            margin: EdgeInsets.all(14),
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(colors: [
                  Colors.amber.withOpacity(0.6),
                  Colors.transparent,
                  Colors.amber.withOpacity(0.5),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      widget.places[idx].image,
                      height: 80,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      widget.places[idx].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
