import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:revendinea/src/store/drawer_store.dart';
import 'package:revendinea/src/ui/screen/home/home_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
	
	PageController _pageController = PageController();
	DrawerStore _drawerStore = GetIt.I<DrawerStore>();
	
	@override
  void initState() {
    super.initState();
    reaction((_) => _drawerStore.page, (page)=> _pageController.jumpToPage(page));
  }
	
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
	    body: PageView(
		    controller: _pageController,
		    physics: NeverScrollableScrollPhysics(),
		   children: [
		   	HomeScreen(),
		   	Container(),
		   	Container(),
		   	Container(),
		   	Container(),
		   ],
	    ),
      ),
    );
  }
}

