// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:skillworker/widgets/recent_booking_page.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
