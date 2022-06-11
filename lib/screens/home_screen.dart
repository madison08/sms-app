// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jkp_sms/provider/Sms.dart';
import 'package:jkp_sms/screens/message_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();

    // initializeDateFormatting();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('hello');

      Provider.of<SmsProvider>(context, listen: false).getAllSms();
    });
  }

  int selectedIndex = 0;

  List screens = [
    MessageScreen(),
    Center(
      child: Text("call"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Center(
          child: Text(
            "😀",
            style: TextStyle(
              fontSize: 28.0,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Messages",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontSize: 25.0,
          ),
        ),
      ),
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.white,
        height: 70.0,
        selectedIndex: selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(icon: Icon(Icons.sms), label: ""),
          NavigationDestination(icon: Icon(Icons.phone), label: ""),
        ],
      ),
    );
  }
}
