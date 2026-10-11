import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:statisfuel/i18n/strings.g.dart';

extension DateExtensions on DateTime? {
  String toFormattedString({String? format}) {
    format ??= t.global.date.format;
    return this != null ? DateFormat(format).format(this!) : '-';
  }

  String getMonthString(BuildContext context) {
    return this != null
        ? DateFormat(
            t.global.date.monthFormat,
            TranslationProvider.of(context).flutterLocale.languageCode,
          ).format(this!)
        : '-';
  }

  String getMonthShortString(BuildContext context) {
    return this != null
        ? DateFormat(
            t.global.date.monthShortFormat,
            TranslationProvider.of(context).flutterLocale.languageCode,
          ).format(this!)
        : '-';
  }

  int getDayOfYear() {
    if (this == null) {
      return 0;
    }

    final date = DateTime.utc(this!.year, this!.month, this!.day);
    final unixEpoch = DateTime.utc(1970);
    return date.difference(unixEpoch).inDays + 1;
  }
}
