// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:ui';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'images/intro1.jpg'), // Replace with your image asset path
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  // top: MediaQuery.of(context).size.height * 0.1,
                  // bottom: 0,
                  // left: 0,
                  // right: 0,
                  child: ClipRRect(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                      child: BackdropFilter(
                        // blendMode: BlendMode.softLight,
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Container(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.25,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Quick Response',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Get quck response from skilled',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'workers near you',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
