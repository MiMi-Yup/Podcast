import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get toStringDateEx => DateFormat('dd/MM/yyyy').format(this);
  String get toStringDateTimeEx => DateFormat('hh:mm dd/MM/yyyy').format(this);
}
