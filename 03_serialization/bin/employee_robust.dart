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
    if (!(json["id"] is String)) {
      throw Exception("no field 'id' found in $json");
    }
    var result = Employee(json["id"]);
    if ((json["name"] is String)) {
      result.name = json['name'];
    }
    if ((json["hoursPerWeek"] is num)) {
      result.hoursPerWeek = json['hoursPerWeek'].toDouble();
    }
    if ((json["salary"] is num)) {
      result.salary = json['salary'].toDouble();
    }
    print(json['languages'].runtimeType); // List<dynamic>
    if ((json["languages"] is List<String>)) {
      result.languages = List<String>.from(json['languages']);
    }
    return result;
  }
}
