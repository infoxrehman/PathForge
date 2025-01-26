import 'package:flutter/material.dart';

class ConnectWalletScreen extends StatelessWidget {
  const ConnectWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Card(
            elevation: 10,
            color: Colors.grey.shade900,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: BorderSide(
                color: Colors.white, // Border color
                width: 2, // Border width
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 90,
                  ),
                  Text(
                    "Good to see here buddy!",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Roboto",
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Sorry to say, This feature is under development. Come Back Soon!",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    "assets/gif/UFO.gif",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
