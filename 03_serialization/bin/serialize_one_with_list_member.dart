import 'dart:convert';
import 'dart:io';
import 'employee.dart';

void main() async {
  final employee = Employee("gs123");
  employee.name = "GS retired";
  employee.hoursPerWeek = 10;
  employee.salary = 0;
  employee.languages = ["C#", "Dart"];

  // final jsonString = jsonEncode(employee.toJson());
  var encoder = const JsonEncoder.withIndent('  ');
  String jsonString = encoder.convert(employee.toJson());

  final file = File('test.json');
  await file.writeAsString(jsonString);
  print('Saved to file.');

  final readJsonString = await file.readAsString();
  final Map<String, dynamic> jsonMap = jsonDecode(readJsonString);
  final loaded = Employee.fromJson(jsonMap);

  print(
    "loaded employee: id: ${loaded.id}, name: ${loaded.name}, "
    "salary: ${loaded.salary}, hoursPerWeek: ${loaded.hoursPerWeek}, "
    "languages: ${loaded.languages}",
  );
}
