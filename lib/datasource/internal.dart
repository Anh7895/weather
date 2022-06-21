

class Internal {
  static Internal _instance = new Internal.internal();

  Internal.internal();

  factory Internal() => _instance;

  List<int> distanceFilter = [3, 10, 20];
  var selectDistance = 3;
}
