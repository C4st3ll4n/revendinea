import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:revendinea/src/model/User.dart';
import 'package:revendinea/src/repository/UserRepository.dart';
import 'package:revendinea/src/store/user_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email;

  @action
  setEmail(String newEmail) => email = newEmail;

  @observable
  String senha;

  @action
  void setSenha(String value) => senha = value;

  @computed
  bool get senhaValid => senha != null && senha.length >= 4;

  String get senhaError {
    if (senha == null || senhaValid)
      return null;
    else if (senha.isEmpty)
      return "Senha não pode estar vazio";
    else
      return "Senha muito pequena";
  }

  @computed
  bool get emailValid =>
      email != null && email.contains("@") && email.contains(".com");

  String get emailError {
    if (email == null || emailValid)
      return null;
    else if (email.isEmpty)
      return "Email não pode estar vazio";
    else
      return "Email inválido";
  }

  @computed
  bool get isFormValid => emailValid && senhaValid;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  void setloading(bool value) => loading = value;

  @action
  Future<void> _loginWithEmail() async {
    loading = true;

    User user = User(email: email, password: senha);
    try {
      user = await UserRepository().singIn(user);
      GetIt.I<UserStore>().set(user);
    } catch (e) {
      error = e;
    }
    
    loading = false;
  }

  @computed
  Function get loginPressed => (isFormValid && !loading) ? _loginWithEmail : null;
}
