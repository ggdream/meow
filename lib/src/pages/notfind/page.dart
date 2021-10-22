import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:meow/src/router/router.dart';
import 'package:meow/src/widgets/widgets.dart';

class NotFindPage extends StatelessWidget {
  const NotFindPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeowAppBar(),
      body: Center(
        child: OutlinedButton(
          onPressed: () => Get.toNamed(AppRouter.nameHome),
          child: Text('返回首页'),
        ),
      ),
    );
  }
}
