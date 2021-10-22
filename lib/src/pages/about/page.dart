import 'package:flutter/material.dart';

import 'package:meow/src/config/config.dart';
import 'package:meow/src/tools/tools.dart';
import 'package:meow/src/widgets/widgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeowAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _genBodyView(),
      ),
    );
  }

  List<Widget> _genBodyView() {
    final List<Widget> ret = [];

    if (Config.avatar.isNotEmpty) {
      ret.add(
        ClipOval(
          child: Tools.getImage(
            Config.avatar,
            width: 48,
            height: 48,
          ),
        ),
      );
      ret.add(SizedBox(height: 16));
    }

    if (Config.profiles.isNotEmpty) {
      Config.profiles.forEach((key, value) {
        ret.add(
          ListTile(
            leading: Text(key.toString()),
            title: Text(value.toString()),
          ),
        );
      });
    }

    return ret;
  }
}
