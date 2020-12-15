import 'package:flutter/material.dart';
import 'package:flutter_test_solidsoftware/pages/color_page/colors_page.dart';
import 'package:flutter_test_solidsoftware/pages/color_page/colors_provider.dart';
import 'package:flutter_test_solidsoftware/pages/networking_page/networking_page.dart';
import 'package:flutter_test_solidsoftware/pages/networking_page/networking_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Colors',
                ),
                Tab(text: 'Networking')
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ChangeNotifierProvider(
                  create: (_) => ColorsProvider(), child: ColorsPage()),
              ChangeNotifierProvider(
                  create: (_) => NetworkingProvider(), child: NetworkingPage())
            ],
          ),
        ),
      ),
    );
  }
}
