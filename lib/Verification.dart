import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'new_password.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Verification> {
  bool _onEditing = true;
  String? _code;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Pharaonic Scanning",
              style: GoogleFonts.oxanium(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
          centerTitle: true,
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
                      // Add some spacing between icon and text
                      Text(
                        "Verification",
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
                  height: 30.0,
                ),
                const Text(
                  'Enter your code',
                  style: TextStyle(fontSize: 20.0),
                ),
                VerificationCode(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Theme.of(context).cardColor),
                  keyboardType: TextInputType.number,
                  underlineColor: Colors
                      .black, // If this is null it will use primaryColor: Colors.red from Theme
                  length: 4,
                  cursorColor: Colors
                      .black54, // If this is null it will default to the ambient
                  // clearAll is NOT required, you can delete it
                  // takes any widget, so you can implement your design
                  clearAll: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'clear all',
                      style: TextStyle(
                          fontSize: 14.0,
                          decoration: TextDecoration.underline,
                          color: Colors.black87),
                    ),
                  ),
                  margin: const EdgeInsets.all(12),
                  onCompleted: (String value) {
                    setState(() {
                      _code = value;
                    });
                  },
                  onEditing: (bool value) {
                    setState(() {
                      _onEditing = value;
                    });
                    if (!_onEditing) FocusScope.of(context).unfocus();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: _onEditing
                        ? const Text(
                            'Please nter full code',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text('Your code: $_code'),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 290.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.black,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print('code is : $_code');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NewPassword()),
                      );
                    },
                    child: Text(
                      'Send code',
                      style: GoogleFonts.oxanium(
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100.0,
                ),
                Text(
                  'Don\'t have an account? ',
                  style: GoogleFonts.oxanium(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: 150.0,
                  height: 45.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.black,
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print('code is : $_code');
                    },
                    child: Text(
                      'Sign up',
                      style: GoogleFonts.oxanium(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                    ),
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
