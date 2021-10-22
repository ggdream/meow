import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meow/src/config/config.dart';
import 'package:meow/src/router/router.dart';
import 'package:meow/src/tools/tools.dart';
import 'package:meow/src/widgets/widgets.dart';

class DocsPage extends StatefulWidget {
  const DocsPage({Key? key}) : super(key: key);

  @override
  _DocsPageState createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  final String? hash = Get.parameters['hash'];

  String _data = '';

  @override
  void initState() {
    _getText();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeowAppBar(),
      body: Text('data'),
    );
  }

  _getText() async {
    if (hash == null) {
      await Get.toNamed(AppRouter.nameNotFind);
      return;
    }

    try {
      final id = Tools.decodeId(hash!);
      final path = DefaultConfig.markdown + '/$id';

      final data = await DefaultAssetBundle.of(context).loadString(path);
      setState(() {
        _data = data;
      });
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}
