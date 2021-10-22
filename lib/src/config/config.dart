import 'package:meow/src/model/model.dart';

class Config {
  static String label = 'Meow';

  static String avatar = '';

  static Map<String, List<Route>> routes = {};

  static Map<dynamic, dynamic> profiles = {};
}

class DefaultConfig {
  static const location = 'assets/.meow';

  static const markdown = '$location/docs';

  static const assets = '$location/assets';
}
