import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharonic/PlaceDetails/place_details.dart';
import 'package:pharonic/core/widgets/more_options.dart';
import 'package:pharonic/models/place_model.dart';
import 'package:pharonic/services/firebase_service.dart';

import 'favorites/favourite.dart';
import 'history.dart';
import 'home/home.dart';
import '../scaninng.dart';
import 'started.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();

  List<PlaceModel> places = [];

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
            MoreOptions(),
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
                            onPressed: () async {
                              places = await FirebaseService()
                                  .searchPlaceByTitle(_searchController.text);
                              setState(() {});
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
                Expanded(
                  child: SearchResultList(
                    items: places,
                  ),
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

class SearchResultList extends StatelessWidget {
  final List<PlaceModel> items;

  const SearchResultList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, idx) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (
                    context,
                  ) =>
                      PlaceDetailView(place: items[idx]),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        items[idx].image,
                        height: 80,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      items[idx].title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
