import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shynder/controllers/auth.dart';
import 'package:shynder/pages/home/home.dart';
import 'package:shynder/pages/login/register.dart';
import 'package:shynder/pages/login/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthController authController = AuthController();
  int _state = 0;
  bool loading = false;

  @override
  void initState() async {
    super.initState();
    bool wasLogged = await authController.verifyIfWasLogged();
    if (wasLogged) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildFooterLogo(),
                ),
                const SizedBox(height: 60),
                _buildTextField(loginController, Icons.login, 'Login', false),
                const SizedBox(height: 30),
                _buildTextField(passwordController, Icons.lock, 'Senha', true),
                const SizedBox(height: 30),
                const Text(
                  'Entre com seu login e senha para entrar em nossa plataforma',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                ),
                const SizedBox(height: 30),
                Center(
                  child: ButtonTheme(
                    minWidth: 100.0,
                    height: 50.0,
                    child: OutlinedButton(
                      onPressed: () async {
                        if (checkLogin(loginController, passwordController)) {
                          setState(() {
                            this.loading = true;
                          });
                          try {
                            await authController.login(
                                loginController.text, passwordController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          } catch (err) {
                            Fluttertoast.showToast(
                              msg: err.toString().split(":")[1],
                              backgroundColor: Colors.red,
                            );
                          } finally {
                            setState(() {
                              this.loading = false;
                            });
                          }
                        }
                      },
                      child: loading
                          ? SizedBox(
                              child: CircularProgressIndicator(),
                              height: 10.0,
                              width: 10.0,
                            )
                          : Text(
                              'Login',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Não possui uma conta?',
                        style: TextStyle(fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text('Cadastre-se',
                          style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Não lembra da senha?',
                        style: TextStyle(fontSize: 16)),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => RegisterScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Clique Aqui',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  checkLogin(TextEditingController login, TextEditingController senha) {
    if (login.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Digite um login valido",
        backgroundColor: Colors.green,
      );
      return false;
    }
    if (senha.text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Digite sua senha",
        backgroundColor: Colors.green,
      );
      return false;
    }
    return true;
  }

  _buildFooterLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          const Text(
            'Spoted',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ],
      );

  _buildTextField(TextEditingController controller, IconData icon,
      String labelText, bool pass) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        //border: Border.all(color: Cores.CorDeDestaque),
        borderRadius: BorderRadius.all(Radius.circular(17.0)),
      ),
      child: TextField(
        controller: controller,
        obscureText: pass,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: const TextStyle(
              color: Colors.white24,
            ),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
