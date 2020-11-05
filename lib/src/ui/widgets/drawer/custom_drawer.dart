import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:revendinea/src/store/user_store.dart';
import 'package:revendinea/src/ui/widgets/drawer/page_section.dart';

import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
	
	
  @override
  Widget build(BuildContext context) {
  	var width = MediaQuery.of(context).size.width *  .65;
    return ClipRRect(
	    borderRadius: BorderRadius.horizontal(right: Radius.circular(60),),
      child: SizedBox(
	      width: width,
	    child: Drawer(
		    child: ListView(
			    children: [
			    	CustomDrawerHeader(),
			    	PageSection()
			    ],
		    ),
	    ),
      ),
    );
  }
}
