void main() {
  var dt = DateTime.parse("2026-02-23 11:12:13");
  print("$dt");
  dt = DateTime.parse("2026-02-23");
  print("$dt");
  assert(dt.isUtc == false);

  dt = DateTime.parse("2026-02-23 11:12:13Z");
  print("$dt");
  assert(dt.isUtc == true);

  // strange, but still "parsable" DateTime strings
  dt = DateTime.parse("2026-02-23 11:12:99");
  print("$dt");
  dt = DateTime.parse("2026-02-23 11:90:13");
  print("$dt");

  // invalid DateTime strings
  // next line throws exception:
  // dt = DateTime.parse("2026-02-23 11:12:100");

  DateTime? dt2 = DateTime.tryParse("2026-02-23 11:12:100");
  assert(dt2 == null);
  dt2 = DateTime.tryParse("2026-02");
  assert(dt2 == null);
  dt2 = DateTime.tryParse("2026-02-23 11:12:99");
  assert(dt2 != null);
  print("$dt2");
}
