// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:skillworker/controllers/authcontroller.dart';
import 'package:skillworker/widgets/recent_booking_card.dart';
import 'package:skillworker/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:skillworker/models/user.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final User _user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
        // ******************************** AVATAR
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25)),
                      child: SizedBox(
                        height: 150,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          NetworkImage('${_user.photoUrl}'),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        children: [
                                          Text(
                                            '${_user.username}',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            'View Profile',
                                            style: TextStyle(),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(),
                                InkWell(
                                  onTap: () {
                                    AuthMethods().logoutUser();
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.logout),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text('Log out')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('${_user.photoUrl}'),
            ),
          ),
        ),

        // ******************************** SEARCH BAR
        title: CupertinoSearchTextField(
          backgroundColor: Colors.white,
          controller: _searchController,
          onSubmitted: (value) {
            print(value);
          },
        ),
      ),
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
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(
                children: [
                  RecentBookingPage(
                    imageUrl:
                        'https://img.smartindustry.com/files/base/ebm/smartindustry/image/2023/06/h_skilled_worker.649c5df9dc1b5.png?auto=format,compress&fit=fill&fill=blur&w=1200&h=630',
                    title: 'Plumber',
                    name: 'Mr. Kingsley Addo',
                    job: 'Fix leakage of Pipe',
                    rating: '4.5',
                  ),
                  RecentBookingPage(
                    imageUrl:
                        'https://www.workbc.ca/sites/default/files/styles/hero_image/public/NTI5NzE_q9KKBgy3ntGlyqhH-7271-NOC.jpg?itok=yeSR4gYp',
                    title: 'Carpenter',
                    name: 'Mrs. Jing Yang',
                    job: 'Fix 3 italian sofas',
                    rating: '4.5',
                  ),
                  RecentBookingPage(
                    imageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKJcpnCsgR48IBK04G4Y1IVQhvL8qgtn6eCqF8QWZ3egeXzXJHRbtm9n-P1GIe5QI8CfE&usqp=CAU',
                    title: 'Maison',
                    name: 'Mr. Kwame Appiah',
                    job: 'Need new washroom',
                    rating: '4.5',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
