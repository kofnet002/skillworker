import 'package:flutter/material.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({Key? key}) : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: au,
        automaticallyImplyLeading: false,
        title: Text('Bookings'),
        // centerTitle: false,
      ),
    );
  }
}
