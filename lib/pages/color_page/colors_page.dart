import 'package:flutter/material.dart';
import 'package:flutter_test_solidsoftware/pages/color_page/colors_provider.dart';
import 'package:provider/provider.dart';

class ColorsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ColorsProvider>(
      builder: (context, provider, _) => Scaffold(
        body: SafeArea(
          child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => provider.getRandomColor(),
              child: Container(
                color: provider.color,
                child: Center(
                    child: Text(
                  'Привет',
                  style: TextStyle(fontSize: 50.0),
                )),
              )),
        ),
      ),
    );
  }
}
