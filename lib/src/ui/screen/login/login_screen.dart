import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:revendinea/src/store/login_store.dart';
import 'package:revendinea/src/ui/screen/signup/signup_screen.dart';
import 'package:revendinea/src/ui/widgets/ErrorBox.dart';

class LoginScreen extends StatelessWidget {
  LoginStore _loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Entrar"),
      ),
      body: Center(
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.symmetric(horizontal: 32),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(
                    builder: (_) => ErrorBox(
                          message: _loginStore.error,
                        )),
                RaisedButton(onPressed: null),
                Text(
                  "Acessar com email",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey[900]),
                ),
                Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: !_loginStore.loading,
                      onChanged: _loginStore.setEmail,
                      cursorColor: Colors.orange,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          errorText: _loginStore.emailError,
                          border: OutlineInputBorder(),
                          labelText: "E-mail"),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 6, left: 6),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "Esqueceu sua senha ?",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.purple),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      enabled: !_loginStore.loading,
                      onChanged: _loginStore.setSenha,
                      cursorColor: Colors.orange,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          isDense: true,
                          errorText: _loginStore.senhaError,
                          border: OutlineInputBorder(),
                          labelText: "Senha"),
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 12),
                      height: 40,
                      child: RaisedButton(
                        color: Colors.orange,
                        disabledColor: Colors.orange[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        textColor: Colors.white,
                        elevation: 0,
                        onPressed: _loginStore.loginPressed,
                        child: _loginStore.loading
                            ? CircularProgressIndicator(
                                backgroundColor: Colors.white,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.purple),
                              )
                            : Text(
                                "ENTRAR",
                              ),
                      ),
                    ),
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "Não tem uma conta?",
                        style: TextStyle(fontSize: 16),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          " Cadastre-se",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
