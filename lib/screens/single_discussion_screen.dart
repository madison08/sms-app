import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:jkp_sms/provider/Sms.dart';
import 'package:provider/provider.dart';
import 'package:sms_advanced/sms_advanced.dart';

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
    var _deviceWidth = MediaQuery.of(context).size.width;

    List discParm = ModalRoute.of(context)!.settings.arguments as List;

    return Scaffold(
        backgroundColor: Colors.white,
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
                physics: BouncingScrollPhysics(),
                reverse: true,
                itemCount: smsProvider.discussion.length,
                itemBuilder: (context, index) {
                  print(smsProvider.discussion[index].kind);

                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: smsProvider.discussion[index].kind ==
                              SmsMessageKind.Received
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      children: [
                        smsProvider.discussion[index].kind ==
                                SmsMessageKind.Received
                            ? Text("")
                            : Text(DateFormat.Hm()
                                .format(smsProvider.discussion[index].date)),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: smsProvider.discussion[index].kind ==
                                    SmsMessageKind.Received
                                ? Color(0xFFeaeaea)
                                : Color(0xFF4464cf),
                          ),
                          padding: EdgeInsets.all(15.0),
                          width: _deviceWidth * 0.7,
                          child: Text(
                            smsProvider.discussion[index].body,
                            style: TextStyle(
                              color: smsProvider.discussion[index].kind ==
                                      SmsMessageKind.Received
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        smsProvider.discussion[index].kind ==
                                SmsMessageKind.Received
                            ? Text(DateFormat.Hm()
                                .format(smsProvider.discussion[index].date))
                            : Text(""),
                      ],
                    ),
                  );
                });
          },
        ));
  }
}
