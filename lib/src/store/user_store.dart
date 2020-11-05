import 'package:mobx/mobx.dart';
import 'package:revendinea/src/model/User.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
	
	@observable
	User user;
	
	@action
	void set(User value) => user = value;
	
	@computed
	bool get isLogged => user != null;
}
