import 'package:flutter/material.dart';
import 'package:revendinea/src/ui/widgets/drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    appBar: AppBar(),
	    drawer: CustomDrawer(),
    );
  }
}
