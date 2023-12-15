// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillworker/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        // ******************************** AVATAR
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
                'https://www.mtsolar.us/wp-content/uploads/2020/04/avatar-placeholder.png'),
          ),
        ),

        // ******************************** SEARCH BAR
        title: CupertinoSearchTextField(),

        // ******************************** LOGOUT BUTTON
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
              ))
        ],
      ),

      // ******************************** BODY

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent Bookings',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Kanit'),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://www.immigrationcanadaservices.com/wp-content/uploads/2014/11/ALBERTA-Semi-Skilled-Worker-Program.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


//  Provider.of<ThemeProvider>(context, listen: false)
//                     .toggleTheme();