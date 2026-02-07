class Employee {
  Employee(this.id);
  String id;
  String name = "unknown";
  double hoursPerWeek = 40;
  double salary = 1234;
  List<String> languages = [];

  // Object -> Map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "hoursPerWeek": hoursPerWeek,
      "salary": salary,
      "languages": languages,
    };
  }

  // Map -> Object
  factory Employee.fromJson(Map<String, dynamic> json) {
    if (json["id"] == null) {
      throw Exception("no field 'id' found in $json");
    }
    var result = Employee(json["id"]);
    result.name = json['name'];
    result.hoursPerWeek = json['hoursPerWeek'];
    result.salary = json['salary'];
    print(json['languages'].runtimeType); // List<dynamic>
    result.languages = List<String>.from(json['languages']);
    return result;
  }
}
