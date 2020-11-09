import 'package:flutter/material.dart';
import 'package:revendinea/src/ui/screen/base/base_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(elevation: 0),
          scaffoldBackgroundColor: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: Colors.purple),
      title: "Revendinea",
      home: BaseScreen(),
      //home: CategoryScreen(),
    );
  }
}
