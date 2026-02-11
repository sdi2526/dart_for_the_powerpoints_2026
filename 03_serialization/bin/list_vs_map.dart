//import 'dart:io';
import 'dart:math';

import 'employee.dart';

void main(List<String> arguments) async {
  fillAndSearchMap(100000, 10000);
  // print("press any key to continue ...");
  // stdin.readLineSync();
  fillAndSearchList(100000, 10000);
}

void fillAndSearchList(int employeeCount, int loopCount) {
  List<Employee> employees = [];
  print("start inserting in list...");
  for (int i = 0; i < employeeCount; i++) {
    employees.add(Employee(i.toString()));
  }

  print("start searching in list ...");
  var random = Random();
  for (int i = 0; i < loopCount; i++) {
    if (i % 1000 == 0) {
      print("i is $i");
    }
    var id = random.nextInt(employeeCount - 1).toString();
    var found = false;
    for (var employee in employees) {
      if (employee.id == id) {
        found = true;
        break;
      }
    }
    if (!found) {
      print("did not find employee with id=$id");
    }
  }
}

void fillAndSearchMap(int employeeCount, int loopCount) {
  Map<String, Employee> employees = {};
  print("start inserting in map ...");
  for (int i = 0; i < employeeCount; i++) {
    var id = i.toString();
    employees[id] = Employee(id);
  }

  print("start searching in map ...");
  var random = Random();
  for (int i = 0; i < loopCount; i++) {
    if (i % 1000 == 0) {
      print("i is $i");
    }
    var id = random.nextInt(employeeCount - 1).toString();
    //id = "xyz123";
    var employee = employees[id];
    if (employee == null) {
      print("did not find employee with id=$id");
    } else if (employee.id != id) {
      print("not matching id");
    }
  }
}
