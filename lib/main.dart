import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:revendinea/src/app.dart';
import 'package:revendinea/src/store/drawer_store.dart';
import 'package:revendinea/src/store/user_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  await initializeParser();
  runApp(App());
}

Future initializeParser() async{
  await Parse().initialize("aFoDZWr1qZ9AL472OyaglO2lHgipwXmFyy4NVj0d",
      "https://parseapi.back4app.com/",
      clientKey: "ilNm8SejdAcIX4MH7MoFG5KZ1wg57HnB5eiqiTDy",
      autoSendSessionId: true,
      debug: true
  );
}

void setupLocator(){
  GetIt.I.registerSingleton(DrawerStore());
  GetIt.I.registerSingleton(UserStore());
}
