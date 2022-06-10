import 'package:flutter/material.dart';

import 'package:sms/sms.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SmsQuery query = new SmsQuery();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("message"),
    );
  }
}
