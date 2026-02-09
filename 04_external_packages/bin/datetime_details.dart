import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  var dt = DateTime.now();
  var dtInUtc = dt.toUtc();
  assert(dt.isUtc == false);
  assert(dtInUtc.isUtc == true);
  var dtBackToLocal = dtInUtc.toLocal();

  print("dt: $dt");
  print("dtInUtc: $dtInUtc");
  print("dtBackToLocal: $dtBackToLocal");

  assert(dt.hour == dtInUtc.hour + 1);

  print("dt.microsecondsSinceEpoch: ${dt.microsecondsSinceEpoch}");
  var dtEpoch = DateTime.fromMicrosecondsSinceEpoch(0, isUtc: true);
  print("dtEpoch: $dtEpoch");
  var dDay = DateTime.utc(1944, 6, 6);
  print("dday.microsecondsSinceEpoch: ${dDay.microsecondsSinceEpoch}");

  assert(dt.microsecondsSinceEpoch == dtInUtc.microsecondsSinceEpoch);

  tz.initializeTimeZones();
  final tzBerlin = tz.getLocation("Europe/Berlin");
  final tzSydney = tz.getLocation("Australia/Sydney");
  final dtBerlin = tz.TZDateTime.from(dtInUtc, tzBerlin);
  final dtSydney = tz.TZDateTime.from(dtInUtc, tzSydney);
  print("dtInUtc: $dtInUtc");
  print("dtBerlin: $dtBerlin");
  print("dtSydney: $dtSydney");
}

  // max micro seconds:      8,640,000,000,000,000,000
  // max int native (64bit): 9,223,372,036,854,775,807
  // max int web:            9,007,199,254,740,991
  // 365*24*3600*1000*1000 = 31.536.000.000.000

