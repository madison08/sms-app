import 'package:sms_advanced/contact.dart';
import 'package:sms_advanced/sms_advanced.dart';

class Discusion {
  final int? id;
  final String? address;
  final Contact? contact;
  final List<SmsMessage>? messages;
  final int? threadId;

  Discusion(
      {required this.id,
      required this.address,
      required this.contact,
      required this.messages,
      required this.threadId});
}
