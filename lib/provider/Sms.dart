import 'package:flutter/widgets.dart';
import 'package:jkp_sms/models/Discusion.dart';

import 'package:sms_advanced/sms_advanced.dart';

class SmsProvider with ChangeNotifier {
  bool smsLoader = false;

  List _sms = [];

  List discusion = [];

  List get sms {
    return [..._sms];
  }

  void getAllSms() async {
    smsLoader = true;
    notifyListeners();

    SmsQuery query = new SmsQuery();

    List<SmsThread> threads = await query.getAllThreads;

    threads.forEach((disc) {
      return _sms.add(Discusion(
          id: disc.id,
          address: disc.address,
          contact: disc.contact,
          messages: disc.messages,
          threadId: disc.threadId));
    });

    // _sms = threads;

    print("-----INFO--------");
    print(threads[0].address);

    smsLoader = false;
    notifyListeners();
  }
}
