
import 'package:intl/intl.dart';


class FormatCurrency{
  static String formatCurrency(String value) {
    double amount = double.tryParse(value) ?? 0.0;
    return "\$${NumberFormat("##,##,##0.00").format(amount)}";
  }
}
