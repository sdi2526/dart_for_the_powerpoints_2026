import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  print("with local time: ");
  //var dt = DateTime(2026, 3, 29, 1, 30);
  //var dt = DateTime(2026, 10, 25, 0, 30);
  var dt = DateTime(2025, 3, 30, 0, 30);
  for (int i = 0; i < 6; i++) {
    print("$i: $dt");
    dt = dt.add(Duration(hours: 1));
  }

  print("\nwith utc time: ");
  dt = DateTime.utc(2026, 10, 25, 0, 30);
  for (int i = 0; i < 6; i++) {
    print("$i: $dt");
    dt = dt.add(Duration(hours: 1));
  }

  print("\nwith TZDateTime: ");
  tz.initializeTimeZones();
  final tzBerlin = tz.getLocation("Europe/Berlin");
  dt = tz.TZDateTime(tzBerlin, 2026, 10, 25, 0, 30);
  for (int i = 0; i < 6; i++) {
    print("$i: $dt");
    dt = dt.add(Duration(hours: 1));
  }
}
