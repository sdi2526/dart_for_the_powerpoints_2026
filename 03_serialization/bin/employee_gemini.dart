class Employee {
  String id;
  String name;
  double hoursPerWeek;
  double salary;
  List<String> languages;

  Employee(
    this.id, {
    this.name = "unknown",
    this.hoursPerWeek = 40,
    this.salary = 1234,
    this.languages = const [],
  });

  // Converts a Map (JSON) into an Employee instance
  Employee.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'] ?? "unknown",
      hoursPerWeek = (json['hoursPerWeek'] as num?)?.toDouble() ?? 40.0,
      salary = (json['salary'] as num?)?.toDouble() ?? 1234.0,
      languages = List<String>.from(json['languages'] ?? []);

  // Converts an Employee instance into a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'hoursPerWeek': hoursPerWeek,
      'salary': salary,
      'languages': languages,
    };
  }
}
