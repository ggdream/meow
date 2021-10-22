import 'package:get/get.dart';

import 'package:meow/src/pages/about/about.dart';
import 'package:meow/src/pages/docs/docs.dart';
import 'package:meow/src/pages/home/home.dart';
import 'package:meow/src/pages/notfind/notfind.dart';

class AppRouter {
  static const nameHome = '/';
  static const nameDocs = '/docs/:hash';
  static const nameAbout = '/';
  static const nameNotFind = '/404';

  static GetPage unknownPage() => GetPage(
        name: nameNotFind,
        page: () => NotFindPage(),
      );

  static List<GetPage> routes = [
    GetPage(name: nameHome, page: () => HomePage()),
    GetPage(name: nameDocs, page: () => DocsPage()),
    GetPage(name: nameAbout, page: () => AboutPage()),
  ];
}
