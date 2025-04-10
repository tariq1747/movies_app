import 'package:intl/intl.dart';

extension DateFormatExtension on String {
  /// Converts 'yyyy-MM-dd' (e.g., '2025-04-09') to 'MMMM yyyy' (e.g., 'April 2025')
  String toMonthYearFormat() {
    try {
      final date = DateTime.parse(this);
      return DateFormat('MMMM yyyy').format(date);
    } catch (e) {
      return this; // fallback if parse fails
    }
  }
}
