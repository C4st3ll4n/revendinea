import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:revendinea/src/model/User.dart';
import 'package:revendinea/src/shared/parse_errors.dart';

import 'interface/IUserRepository.dart';

class UserRepository implements IUserRepository{
  @override
  Future signUp(User user) async {
    final parserUser = ParseUser(
        user.email,
        user.password,
        user.email);
    
    parserUser.set<String>(kUserName, user.name);
    parserUser.set<String>(kUserPhone, user.phone);
    parserUser.set(kUserType, user.type.index);
    
    ParseResponse response = await parserUser.signUp();
    if(response.success){
      return User.fromParse(response.result);
    }else{
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  @override
  Future logOut(User user) async{
    // TODO: implement logOut
  }

  @override
  Future singIn(User user) async {
    final parserUser = ParseUser(
        user.email,
        user.password,
        user.email).login();
  
    ParseResponse response = await parserUser;
    
    if(response.success){
      return User.fromParse(response.result);
    }else{
      return Future.error(ParseErrors.getDescription(response.error.code));
    }  }

}