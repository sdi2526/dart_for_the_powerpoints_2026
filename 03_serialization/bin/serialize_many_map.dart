import 'dart:convert';
import 'dart:io';
import 'employee.dart';

void main() async {
  var employees = <String, Employee>{};

  var employee = Employee("gs123");
  employee.name = "GS retired";
  employee.hoursPerWeek = 10;
  employee.salary = 0;
  employee.languages = ["C#", "Dart"];
  employees["gs123"] = employee;

  employees["x"] = Employee("x");

  var encoder = const JsonEncoder.withIndent('  ');
  String jsonString = encoder.convert(employees);

  final file = File('test.json');
  await file.writeAsString(jsonString);
  print('Saved to file.');

  final readJsonString = await file.readAsString();
  final Map<String, dynamic> jsonMap = jsonDecode(readJsonString);
  var readEmployees = <String, Employee>{};
  for (var entry in jsonMap.entries) {
    readEmployees[entry.key] = Employee.fromJson(entry.value);
  }

  print("read ${readEmployees.length} employees");
}
