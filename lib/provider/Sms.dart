import 'package:flutter/widgets.dart';
import 'package:jkp_sms/models/Discusion.dart';
import 'package:sms_advanced/contact.dart';

import 'package:sms_advanced/sms_advanced.dart';

class SmsProvider with ChangeNotifier {
  SmsQuery query = new SmsQuery();

  ContactQuery contacts = new ContactQuery();

  bool smsLoader = false;
  bool discLoader = false;

  List _sms = [];

  List _discusion = [];

  List get sms {
    return [..._sms];
  }

  List get discussion {
    return [..._discusion];
  }

  void getAllSms() async {
    smsLoader = true;
    notifyListeners();

    List<SmsThread> threads = await query.getAllThreads;

    threads.forEach((disc) async {
      var contactInfos = await contacts.queryContact(disc.address);

      return _sms.add(
        Discusion(
          id: disc.id,
          address: disc.address,
          contact: disc.contact,
          messages: disc.messages,
          threadId: disc.threadId,
          userInfo: contactInfos,
        ),
      );
    });

    // _sms = threads;

    print("-----INFO--------");
    print(threads[0].address);
    print(threads[25].address);

    smsLoader = false;
    notifyListeners();
  }

  void getSpecificSms(threadId) async {
    discLoader = true;
    notifyListeners();
    List specSms = await query.querySms(
      threadId: threadId,
      // address: getContact
    );

    _discusion = specSms;

    print(specSms);

    discLoader = false;
    notifyListeners();
  }

  void getAllContact() async {
    // List getContacts = await contacts.queryContact()
  }
}
