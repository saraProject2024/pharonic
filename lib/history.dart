import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_card/image_card.dart';

import '../abu_simple.dart';
import 'favorites/favourite.dart';
import 'grandegyption_museum.dart';
import 'home/home.dart';
import 'pyramids.dart';
import 'scaninng.dart';
import 'search.dart';
import 'started.dart';
import 'templet.dart';

class History extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  History({super.key});

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
                'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202024-02-05%20152208.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 130.0,
                            ),
                            // Add some spacing between icon and text
                            Text(
                              "History",
                              style: GoogleFonts.oxanium(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      FillImageCard(
                        width: 320,
                        heightImage: 120,
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
                                        fontSize: 18.0,
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
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 100,
                              ),
                              IconButton(
                                color: Colors.black,
                                icon:
                                    const Icon(Icons.favorite_outline_outlined),
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
                        height: 15.0,
                      ),
                      FillImageCard(
                        width: 320,
                        heightImage: 120,
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
                                        fontSize: 18.0,
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
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 140,
                              ),
                              IconButton(
                                color: Colors.black,
                                icon:
                                    const Icon(Icons.favorite_outline_outlined),
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
                        height: 15.0,
                      ),
                      FillImageCard(
                        width: 320,
                        heightImage: 120,
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
                                        fontSize: 18.0,
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
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 150,
                              ),
                              IconButton(
                                color: Colors.black,
                                icon:
                                    const Icon(Icons.favorite_outline_outlined),
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
                        height: 15.0,
                      ),
                      FillImageCard(
                        width: 320,
                        heightImage: 120,
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
                                        fontSize: 18.0,
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
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 70.0,
                              ),
                              IconButton(
                                color: Colors.black,
                                icon:
                                    const Icon(Icons.favorite_outline_outlined),
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
                        height: 15.0,
                      ),
                      Container(
                        width: 380.0,
                        height: 75.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                        child: AppBar(
                          backgroundColor: Colors.white,
                          elevation: 0.0,
                          title: const Row(
                            children: [],
                          ),
                          actions: [
                            const SizedBox(
                              width: 40,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const CircleAvatar(
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
                                const Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 7.0,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 218, 165, 32),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const CircleAvatar(
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
                                const Text(
                                  'Search',
                                  style: TextStyle(
                                    fontSize: 7.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: NetworkImage(
                                        'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20215802.png'),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Scaning()),
                                    );
                                  },
                                ),
                                const Text(
                                  'Scan Here',
                                  style: TextStyle(
                                    fontSize: 7.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const CircleAvatar(
                                    radius: 40.0,
                                    backgroundImage: NetworkImage(
                                        'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Screenshot%202023-12-19%20203448.png'),
                                  ),
                                  onPressed: () {
                                    print("Profile page");
                                  },
                                ),
                                const Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontSize: 7.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
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
      ),
    );
  }
}
