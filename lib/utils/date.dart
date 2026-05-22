import 'package:intl/intl.dart';
import 'package:statisfuel/i18n/strings.g.dart';

extension DateExtensions on DateTime? {
  String toFormattedString() {
    return this != null ? DateFormat(t.global.date.format).format(this!) : '-';
  }
}
