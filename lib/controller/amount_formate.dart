
import 'package:intl/intl.dart';


class FormatCurrency{
  static String formatCurrency(String value) {
    double amount = double.tryParse(value) ?? 0.0;
    return "\$${NumberFormat("##,##,###").format(amount)}";
  }
}
