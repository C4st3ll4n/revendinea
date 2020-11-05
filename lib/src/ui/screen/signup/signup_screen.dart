import 'package:brasil_fields/formatter/telefone_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revendinea/src/app.dart';
import 'package:revendinea/src/store/cadastro_store.dart';
import 'package:revendinea/src/ui/screen/base/base_screen.dart';
import 'package:revendinea/src/ui/screen/login/login_screen.dart';
import 'package:revendinea/src/ui/widgets/ErrorBox.dart';
import 'package:revendinea/src/ui/widgets/input/FormInput.dart';

class SignUpScreen extends StatelessWidget {
  CadastroStore _cadastroStore = CadastroStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Entrar"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            margin: EdgeInsets.symmetric(horizontal: 32),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: _signupBody(context),
            ),
          ),
        ),
      ),
    );
  }

  Column _signupBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Observer(
            builder: (_) => ErrorBox(
                  message: _cadastroStore.error,
                )),
        Observer(
          builder: (_) => FormInput(
              label: "Apelido",
              enable: !_cadastroStore.loading,
              keyboardType: TextInputType.name,
              hint: "",
              error: _cadastroStore.nameError,
              action: _cadastroStore.setName,
              helper: "Como irá aparecer nos anúncios e para outros usuários"),
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Email",
            enable: !_cadastroStore.loading,
            keyboardType: TextInputType.emailAddress,
            hint: "",
            error: _cadastroStore.emailError,
            action: _cadastroStore.setEmail,
            helper:
                "Enviaremos um e-mail de confirmação, e será seu email para login",
          ),
        ),
        Observer(
          builder: (_) => FormInput(
            label: "Celular",
            enable: !_cadastroStore.loading,
            keyboardType: TextInputType.phone,
            hint: "",
            error: _cadastroStore.celularError,
            action: _cadastroStore.setCelular,
            helper: "Enviaremos notificações dos seus anúncios",
          ),
        ),
        for (Widget w in _passwordForm()) w,
        _signupBtn(),
        for (Widget w in _bottomBar(context)) w
      ],
    );
  }

  Padding _signupBtn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Observer(
        builder: (_) => Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          height: _cadastroStore.loading ? 60 : 40,
          child: RaisedButton(
            color: Colors.orange,
            disabledColor: Colors.orange[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            textColor: Colors.white,
            elevation: 0,
            onPressed: _cadastroStore.signupPressed,
            child: _cadastroStore.loading
                ? CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                  )
                : Text(
                    "CADASTRAR",
                  ),
          ),
        ),
      ),
    );
  }

  List<Widget> _passwordForm() {
    return [
      Observer(
        builder: (_) => FormInput(
          label: "Senha",
          enable: !_cadastroStore.loading,
          keyboardType: TextInputType.visiblePassword,
          hint: "",
          error: _cadastroStore.senhaError,
          action: _cadastroStore.setSenha,
          helper: "Use letras, números e caractéres especiais",
        ),
      ),
      Observer(
        builder: (_) => FormInput(
          label: "Confirmação de senha",
          enable: !_cadastroStore.loading,
          keyboardType: TextInputType.visiblePassword,
          hint: "",
          error: _cadastroStore.confirmacaoSenhaError,
          action: _cadastroStore.setConfirmacaoSenha,
          helper: "As senhas devem ser iguais",
        ),
      ),
    ];
  }

  List<Widget> _bottomBar(BuildContext contexto) {
    return [
      Divider(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              "Já tem uma conta?",
              style: TextStyle(fontSize: 16),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  contexto,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              },
              child: Text(
                " Entrar",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.purple,
                    fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ];
  }
}
