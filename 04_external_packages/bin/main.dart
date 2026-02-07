import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

void main() {
  // Initialize the timezone database
  tz.initializeTimeZones();

  // Get the location object for Sydney
  final sydney = tz.getLocation('Australia/Sydney');

  // Create a time-zone-aware DateTime
  final nowInSydney = tz.TZDateTime.now(sydney);

  print('Current time in Sydney: $nowInSydney');
}
