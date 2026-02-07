import 'dart:convert';
import 'dart:io';
import 'employee.dart';

void main() async {
  var employees = <Employee>[];

  var employee = Employee("gs123");
  employee.name = "GS retired";
  employee.hoursPerWeek = 10;
  employee.salary = 0;
  employee.languages = ["C#", "Dart"];
  employees.add(employee);

  employees.add(Employee("x"));

  var encoder = const JsonEncoder.withIndent('  ');
  String jsonString = encoder.convert(employees);

  final file = File('test.json');
  await file.writeAsString(jsonString);
  print('Saved to file.');

  final readJsonString = await file.readAsString();
  final List<dynamic> jsonList = jsonDecode(readJsonString);
  var readEmployees = <Employee>[];
  for (var entry in jsonList) {
    readEmployees.add(Employee.fromJson(entry));
  }

  print("read ${readEmployees.length} employees");
}
