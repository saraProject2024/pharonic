import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';

import 'abu_simple.dart';
import 'favourite.dart';
import 'grandegyption_museum.dart';
import 'history.dart';
import 'pyramids.dart';
import 'scaninng.dart';
import 'search.dart';
import 'started.dart';
import 'templet.dart';

class Home extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  Home({super.key});
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
      body: Container(
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
                        onPressed: () {
                          // Perform the search here
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
              const SizedBox(
                height: 10.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(children: [
                    const SizedBox(
                      width: 15.0,
                    ),
                    FillImageCard(
                      width: 200,
                      heightImage: 100,
                      color: Colors.white70,
                      imageProvider: const NetworkImage(
                          'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-16%20161231.png'),
                      description: Container(
                        child: Row(
                          children: [
                            const Column(
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
                            const SizedBox(
                              width: 40,
                            ),
                            IconButton(
                              color: Colors.black,
                              icon: const Icon(Icons.favorite_outline_outlined),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Templet()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    FillImageCard(
                      width: 200,
                      heightImage: 100,
                      color: Colors.white70,
                      imageProvider: const NetworkImage(
                          'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-16%20161241.png'),
                      description: Container(
                        child: Row(
                          children: [
                            const Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Aswan',
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
                                    'Abu Simble',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            IconButton(
                              color: Colors.black,
                              icon: const Icon(Icons.favorite_outline_outlined),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Abusimbel()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    FillImageCard(
                      width: 200,
                      heightImage: 100,
                      color: Colors.white70,
                      imageProvider: const NetworkImage(
                          'https://raw.githubusercontent.com/Fadysamy55/ppro/main/WhatsApp%20Image%202023-12-19%20at%2016.53.16_b243dcc8.jpg'),
                      description: Container(
                        child: Row(
                          children: [
                            const Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Giza',
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
                                    'Pyramids',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 60,
                            ),
                            IconButton(
                              color: Colors.black,
                              icon: const Icon(Icons.favorite_outline_outlined),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Pyramids()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    FillImageCard(
                      width: 200,
                      heightImage: 100,
                      color: Colors.white70,
                      imageProvider: const NetworkImage(
                          'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Giza.jpg'),
                      description: Container(
                        child: Row(
                          children: [
                            const Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Giza',
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
                                    'grand egyptian museum',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            IconButton(
                              color: Colors.black,
                              icon: const Icon(Icons.favorite_outline_outlined),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const grandegyptianmuseum()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                  ]),
                ),
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
                              MaterialPageRoute(builder: (context) => Home()),
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
                              MaterialPageRoute(builder: (context) => Search()),
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
    );
  }
}
