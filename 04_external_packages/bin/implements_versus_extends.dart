class Base {
  int i = 0;
  void log() {
    print("in Base");
  }
}

class Ext extends Base {
  @override
  void log() {
    print("in Ext");
  }
}

class Impl implements Base {
  int i = 1;
  void log() {
    print("in Impl");
  }
}

void main() {
  var b = Base();
  print(b.i);
  b.log();
  var e = Ext();
  print(e.i);
  b.log();
  var x = Impl();
  print(x.i);
  x.log();

  b = e;
  b.log();

  b = x;
  b.log();
}
