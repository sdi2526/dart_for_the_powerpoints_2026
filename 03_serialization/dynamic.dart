void main(List<String> arguments) async {
  dynamic d = "abc";
  //d = 1;
  d = d + 1;
  print("d is $d");

  d = [4, 5, 6];
  print(d.runtimeType);
  // next line works also with List<dynamic>
  if (d is List<int>) {
    print("d[1] is ${d[1]}");
  } else {
    print("d is no list");
  }
}
