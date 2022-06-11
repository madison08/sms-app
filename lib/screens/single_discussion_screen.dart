import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:jkp_sms/provider/Sms.dart';
import 'package:provider/provider.dart';

class SingleDiscuScreen extends StatefulWidget {
  const SingleDiscuScreen({Key? key}) : super(key: key);

  @override
  State<SingleDiscuScreen> createState() => _SingleDiscuScreenState();
}

class _SingleDiscuScreenState extends State<SingleDiscuScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      List discParm = ModalRoute.of(context)!.settings.arguments as List;

      final discuss = Provider.of<SmsProvider>(context, listen: false)
          .getSpecificSms(discParm[0]);
    });
  }

  @override
  Widget build(BuildContext context) {
    List discParm = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            ),
          ),
          title: Text(
            discParm[1].toString(),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: Consumer<SmsProvider>(
          builder: (context, smsProvider, child) {
            if (smsProvider.discLoader) {
              return Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
                itemCount: smsProvider.discussion.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(smsProvider.discussion[index].body),
                  );
                });
          },
        ));
  }
}
