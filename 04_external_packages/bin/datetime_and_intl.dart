import 'package:intl/intl.dart';

void main() {
  var dt = DateTime(2025, 2, 23, 8, 3);
  var formatter = DateFormat("dd.MMM.yyyy h:mm");
  print(formatter.format(dt));
  formatter = DateFormat("dd.MMMM.yyyy hh:mm");
  print(formatter.format(dt));

  formatter = DateFormat("EE. dd.MM.yyyy H:mm a");
  print(formatter.format(dt));
}
