import 'package:flutter/material.dart';
import 'package:jkp_sms/provider/Sms.dart';
import 'package:jkp_sms/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SmsProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}
