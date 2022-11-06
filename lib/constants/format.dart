import 'package:intl/intl.dart';

class Format {
  Format._();

  static final numberWithDigit = NumberFormat("#,###.00",);

  static final number = NumberFormat("#,###",);
}