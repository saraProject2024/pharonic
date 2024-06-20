import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/widgets/more_options.dart';
import 'favorites/favourite.dart';
import 'history.dart';
import 'home/home.dart';
import 'scaninng.dart';
import 'search.dart';
import 'started.dart';

class Abusimbel extends StatelessWidget {
  Abusimbel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Pharaonic Scaning",
            style: GoogleFonts.oxanium(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
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
                'https://raw.githubusercontent.com/ardenahany/graduation/main/images/aswan.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Expanded(
            child: Column(children: [
              const SizedBox(
                height: 150.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Aswan",
                  style: GoogleFonts.oxanium(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "abu simbel",
                  style: GoogleFonts.oxanium(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Text(
                "Abu Simbel is a historic site comprising two massive rock-cut temples in the village of Abu Simbel, Aswan Governorate, Upper Egypt, near the border with Sudan. It is located on the western bank of Lake Nasser, about 230 km (140 mi) southwest of Aswan (about 300 km (190 mi) by road). The twin temples were originally carved out of the mountainside in the 13th century BC, during the 19th Dynasty reign of the Pharaoh Ramesses II.",
                style: GoogleFonts.oxanium(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 75.0,
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
                              MaterialPageRoute(builder: (context) => Search()),
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
            ]),
          ),
        ),
      ),
    );
  }
}
