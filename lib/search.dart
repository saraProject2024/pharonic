import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import 'favourite.dart';
import 'history.dart';
import 'home.dart';
import '../scaninng.dart';
import 'started.dart';

class Search extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  Search({super.key});

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
                'https://raw.githubusercontent.com/Fadysamy55/ppro/main/Back%20ground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Expanded(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 100.0,
                      ),
                      const Icon(
                        Icons.search_outlined,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 10.0),
                      // Add some spacing between icon and text
                      Text(
                        "search",
                        style: GoogleFonts.oxanium(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 400.0,
                  height: 90.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0, 5.0),
                  child: Padding(
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
                          hintText: 'Search result...',
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
                ),
                const SizedBox(
                  height: 350,
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
                                MaterialPageRoute(builder: (context) => Home()),
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
                                    builder: (context) => const Scaning()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}