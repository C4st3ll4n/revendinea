import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:revendinea/src/store/drawer_store.dart';
import 'package:revendinea/src/ui/widgets/drawer/page_tile.dart';

class PageSection extends StatelessWidget {
	DrawerStore _ds = GetIt.I<DrawerStore>();
  @override
  Widget build(BuildContext context) {
    return Column(
	    children: [
	    	PageTile(
			    label:"Anúncios",
			    icon:Icons.list,
			    highlited: _ds.page==0,
			    onTap: (){
			    _ds.setPage(0);
			    }
		    ),
		
		    PageTile(
				    label:"Anunciar",
				    icon:Icons.add_comment,
				    highlited: _ds.page==1,
				    onTap: (){
					    _ds.setPage(1);
				    }
		    ),
		
		    PageTile(
				    label:"Chat",
				    icon:Icons.message,
				    highlited: _ds.page==2,
				    onTap: (){
					    _ds.setPage(2);
				    }
		    ),
		
		    PageTile(
				    label:"Favoritos",
				    icon:Icons.favorite,
				    highlited: _ds.page==3,
				    onTap: (){
					    _ds.setPage(3);
				    }
		    ),
		
		    PageTile(
				    label:"Minha conta",
				    icon:Icons.person,
				    highlited: _ds.page==4,
				    onTap: (){
					
					    _ds.setPage(4);
				    }
		    ),
	    ],
    );
  }
}
