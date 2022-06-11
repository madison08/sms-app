// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:intl/date_symbol_data_file.dart';

import 'package:intl/intl.dart';
import 'package:jkp_sms/provider/Sms.dart';
import 'package:provider/provider.dart';

// import 'package:sms_advanced/sms_advanced.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    // var sms = Provider.

    void initState() {
      super.initState();
    }

    return Consumer<SmsProvider>(builder: (ctx, smsProvider, child) {
      if (smsProvider.smsLoader) {
        return Center(child: CircularProgressIndicator());
      }

      return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: smsProvider.sms.length,
          itemBuilder: (context, index) {
            // print(smsProvider.sms[index].userInfo.fullName);

            return Card(
              child: ListTile(
                onTap: () {
                  print("hello");
                  Navigator.pushNamed(context, "/discus", arguments: [
                    smsProvider.sms[index].id,
                    smsProvider.sms[index].userInfo.fullName != null
                        ? smsProvider.sms[index].userInfo.fullName
                        : smsProvider.sms[index].address
                  ]);
                },
                title: Text(smsProvider.sms[index].userInfo.fullName != null
                    ? smsProvider.sms[index].userInfo.fullName
                    : smsProvider.sms[index].address),
                subtitle: Text(
                  smsProvider.sms[index].messages[0].body,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                trailing: Text(DateFormat.MMMMd()
                    .format(smsProvider.sms[index].messages[0].date)),
              ),
            );
          });
    });
  }
}
