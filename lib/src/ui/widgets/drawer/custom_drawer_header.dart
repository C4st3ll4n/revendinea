import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:revendinea/src/store/drawer_store.dart';
import 'package:revendinea/src/store/user_store.dart';
import 'package:revendinea/src/ui/screen/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  final UserStore _userStore = GetIt.I<UserStore>();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        headerClick(context);
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.person,
              size: 35,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Observer(
                builder:(_)=> Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tittle(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Text(
                      subIittle(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String tittle() => _userStore.isLogged? _userStore.user.name : "Acesse sua conta !";
  String subIittle() => _userStore.isLogged? _userStore.user.email : "Clique aqui";
  void headerClick(BuildContext context) => _userStore.isLogged? GetIt.I<DrawerStore>().setPage(4) : Navigator.push(
    context,
    MaterialPageRoute(
        builder: (_) => LoginScreen()
    ),
  );
}
