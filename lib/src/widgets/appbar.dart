import 'package:flutter/material.dart' hide Route;
import 'package:get/get.dart';

import 'package:meow/src/config/config.dart';
import 'package:meow/src/model/model.dart';
import 'package:meow/src/tools/tools.dart';

class MeowAppBar extends StatelessWidget with PreferredSizeWidget {
  MeowAppBar({
    Key? key,
  }) : super(key: key);

  final String label = Config.label;
  final String image = Config.avatar;
  final Map<String, List<Route>> routes = Config.routes;

  @override
  Widget build(BuildContext context) {
    return context.showNavbar
        ? _PCAppBar(
            label: label,
            image: image,
            routes: routes,
          )
        : _MobileAppBar(
            label: label,
            image: image,
            routes: routes,
          );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _PCAppBar extends StatelessWidget with PreferredSizeWidget, Tools {
  const _PCAppBar({
    Key? key,
    required this.label,
    required this.image,
    required this.routes,
  }) : super(key: key);

  final String label;
  final String image;
  final Map<String, List<Route>> routes;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _genLeading(),
      actions: _genNavList(),
    );
  }

  Widget _genLeading() {
    return Text(
      label,
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  List<Widget> _genNavList() {
    final List<Widget> ret = [];

    if (routes.isNotEmpty) {
      routes.forEach((key, routes) => _navItemButton(key, routes));
    }

    if (image.isNotEmpty) {
      ret.add(SizedBox(width: 16));
      ret.add(Tools.genImageView(image));
    }

    return ret;
  }

  Widget _navItemButton(String key, List<Route> routes) {
    return Builder(
      builder: (context) {
        return OutlinedButton(
          onPressed: () {
            Overlay.of(context)?.insert(_overlayEntry(routes));
          },
          child: Text(key),
        );
      },
    );
  }

  OverlayEntry _overlayEntry(List<Route> routes) {
    return OverlayEntry(builder: (context) {
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: Get.width * .6,
          height: Get.height * .6,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(32),
          ),
          child: GridView.extent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 1,
            children: routes.map((e) => _card(e)).toList(),
          ),
        ),
      );
    });
  }

  Widget _card(Route e) {
    return InkWell(
      onTap: () => Get.toNamed('/docs/' + e.path),
      child: Material(
        color: Colors.white,
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 67,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: e.image == null ? null : Tools.getImage(e.image!),
            ),
            SizedBox(height: 8),
            SelectableText(e.title, maxLines: 2),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MobileAppBar extends StatelessWidget with PreferredSizeWidget, Tools {
  const _MobileAppBar({
    Key? key,
    required this.label,
    required this.image,
    required this.routes,
  }) : super(key: key);

  final String label;
  final String image;
  final Map<String, List<Route>> routes;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu_book_rounded),
        );
      }),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: image.isEmpty ? null : [Tools.genImageView(image)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
