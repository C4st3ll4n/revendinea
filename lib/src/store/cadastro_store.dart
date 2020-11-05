import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:revendinea/src/model/User.dart';
import 'package:revendinea/src/repository/UserRepository.dart';
import 'package:revendinea/src/store/user_store.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {
  @observable
  String email;

  @action
  setEmail(String newEmail) => email = newEmail;

  @observable
  String name;

  @action
  setName(String newName) => name = newName;

  @observable
  String celular;

  @action
  void setCelular(String value) => celular = value;

  @observable
  String senha;

  @action
  void setSenha(String value) => senha = value;

  @observable
  String confirmacaoSenha;

  @action
  void setConfirmacaoSenha(String value) => confirmacaoSenha = value;

  @computed
  bool get senhaValid => senha != null && senha.length > 6;

  String get senhaError {
    if (senha == null || senhaValid)
      return null;
    else if (senha.isEmpty)
      return "Senha não pode estar vazio";
    else
      return "Senha muito pequena";
  }

  @computed
  bool get confirmacaoSenhaValid =>
      confirmacaoSenha != null &&
      confirmacaoSenha.length > 6 &&
      confirmacaoSenha == senha;

  String get confirmacaoSenhaError {
    if (confirmacaoSenha == null || confirmacaoSenhaValid)
      return null;
    else if (confirmacaoSenha.isEmpty)
      return "Senha não pode estar vazio";
    else if (confirmacaoSenha != senha)
      return "Senhas não são iguais";
    else
      return "Senha muito pequena";
  }

  @computed
  bool get celularValid => celular != null && celular.length >= 14;

  String get celularError {
    if (celular == null || celularValid)
      return null;
    else if (celular.isEmpty)
      return "Celular não pode estar vazio";
    else
      return "Celular inválido";
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
  bool get nameValid => name != null && name.length > 6;

  String get nameError {
    if (name == null || nameValid)
      return null;
    else if (name.isEmpty)
      return "Nome não pode estar vazio";
    else
      return "Nome muito pequeno";
  }

  @computed
  bool get isFormValid {
    bool isValid =
        nameValid && emailValid && celularValid && confirmacaoSenhaValid;
    return isValid;
  }

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  void setloading(bool value) => loading = value;

  @action
  Future<void> _signUp() async {
    loading = true;

    User user = User(email: email, password: senha, phone: celular, name: name);
    try {
      user = await UserRepository().signUp(user);
      GetIt.I<UserStore>().set(user);
    } catch (e) {
      error = e;
    }

    loading = false;
  }

  @computed
  Function get signupPressed => (isFormValid && !loading) ? _signUp : null;
}
