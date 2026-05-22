import 'package:intl/intl.dart';

extension NumExtensions on num? {
  String toFormattedString({String? unit, NumberFormat? format}) {
    if (this is double) {
      final formatted = format?.format(this) ?? NumberFormat('#,##0.00', 'fr_FR').format(this);
      return unit != null ? '$formatted $unit' : formatted;
    }
    return unit != null ? '${this ?? "-"} $unit' : toString();
  }
}
