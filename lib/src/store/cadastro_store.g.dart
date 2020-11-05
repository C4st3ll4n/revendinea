// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  Computed<bool> _$senhaValidComputed;

  @override
  bool get senhaValid =>
      (_$senhaValidComputed ??= Computed<bool>(() => super.senhaValid,
              name: '_CadastroStore.senhaValid'))
          .value;
  Computed<bool> _$confirmacaoSenhaValidComputed;

  @override
  bool get confirmacaoSenhaValid => (_$confirmacaoSenhaValidComputed ??=
          Computed<bool>(() => super.confirmacaoSenhaValid,
              name: '_CadastroStore.confirmacaoSenhaValid'))
      .value;
  Computed<bool> _$celularValidComputed;

  @override
  bool get celularValid =>
      (_$celularValidComputed ??= Computed<bool>(() => super.celularValid,
              name: '_CadastroStore.celularValid'))
          .value;
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_CadastroStore.emailValid'))
          .value;
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_CadastroStore.nameValid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CadastroStore.isFormValid'))
          .value;
  Computed<Function> _$signupPressedComputed;

  @override
  Function get signupPressed =>
      (_$signupPressedComputed ??= Computed<Function>(() => super.signupPressed,
              name: '_CadastroStore.signupPressed'))
          .value;

  final _$emailAtom = Atom(name: '_CadastroStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$nameAtom = Atom(name: '_CadastroStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$celularAtom = Atom(name: '_CadastroStore.celular');

  @override
  String get celular {
    _$celularAtom.reportRead();
    return super.celular;
  }

  @override
  set celular(String value) {
    _$celularAtom.reportWrite(value, super.celular, () {
      super.celular = value;
    });
  }

  final _$senhaAtom = Atom(name: '_CadastroStore.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$confirmacaoSenhaAtom = Atom(name: '_CadastroStore.confirmacaoSenha');

  @override
  String get confirmacaoSenha {
    _$confirmacaoSenhaAtom.reportRead();
    return super.confirmacaoSenha;
  }

  @override
  set confirmacaoSenha(String value) {
    _$confirmacaoSenhaAtom.reportWrite(value, super.confirmacaoSenha, () {
      super.confirmacaoSenha = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CadastroStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$errorAtom = Atom(name: '_CadastroStore.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_signUpAsyncAction = AsyncAction('_CadastroStore._signUp');

  @override
  Future<void> _signUp() {
    return _$_signUpAsyncAction.run(() => super._signUp());
  }

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

  @override
  dynamic setEmail(String newEmail) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setEmail');
    try {
      return super.setEmail(newEmail);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String newName) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setName');
    try {
      return super.setName(newName);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCelular(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setCelular');
    try {
      return super.setCelular(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmacaoSenha(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setConfirmacaoSenha');
    try {
      return super.setConfirmacaoSenha(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setloading(bool value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setloading');
    try {
      return super.setloading(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
name: ${name},
celular: ${celular},
senha: ${senha},
confirmacaoSenha: ${confirmacaoSenha},
loading: ${loading},
error: ${error},
senhaValid: ${senhaValid},
confirmacaoSenhaValid: ${confirmacaoSenhaValid},
celularValid: ${celularValid},
emailValid: ${emailValid},
nameValid: ${nameValid},
isFormValid: ${isFormValid},
signupPressed: ${signupPressed}
    ''';
  }
}
