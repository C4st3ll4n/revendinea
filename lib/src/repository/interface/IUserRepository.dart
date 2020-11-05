import 'package:revendinea/src/model/User.dart';

abstract class IUserRepository{
	Future signUp(User user);
	Future singIn(User user);
	Future logOut(User user);
}