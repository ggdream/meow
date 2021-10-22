import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meow/src/tools/tools.dart';
import 'package:meow/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeowAppBar(),
      body: bodyView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.animateTo(
            0,
            duration: Duration(milliseconds: 600),
            curve: Curves.bounceIn,
          );
        },
        child: Icon(Icons.arrow_circle_up_rounded),
      ),
    );
  }

  Widget bodyView() {
    return CupertinoScrollbar(
      controller: _controller,
      child: GridView.builder(
        padding: const EdgeInsets.all(24),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 120,
          childAspectRatio: 2 / 3,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Tools.getImage(
                    '',
                    width: 96,
                    height: 72,
                  ),
                ),
                Spacer(),
                SelectableText(''),
                Spacer(),
              ],
            ),
          );
        },
      ),
    );
  }
}
