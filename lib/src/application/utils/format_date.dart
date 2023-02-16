import 'package:intl/intl.dart';

String formatDate(String date) {
  DateTime dateTime = DateTime.parse(date);

  return DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
}
