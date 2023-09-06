import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shynder/controllers/auth.dart';
import 'package:shynder/pages/home/home.dart';
import 'package:shynder/pages/login/login.dart';
import 'package:shynder/pages/login/register.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EmailRecover extends StatefulWidget {
  const EmailRecover({Key? key}) : super(key: key);

  @override
  State<EmailRecover> createState() => _EmailRecoverState();
}

class _EmailRecoverState extends State<EmailRecover> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final AuthController authController = AuthController();
  int stage = 0;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    authController.verifyIfWasLogged(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  buildContainer() {
    switch (this.stage) {
      case 0:
        return _buildTextField(emailController, Icons.email, 'Email', false);
      case 1:
        return Column(
          children: [
            _buildTextField(codeController, Icons.numbers, 'Código', false,
                type: TextInputType.number),
            const SizedBox(height: 30),
            _buildTextField(passController, Icons.password, 'Senha', true),
            const SizedBox(height: 30),
            _buildTextField(
                newPassController, Icons.password, 'Nova Senha', true),
          ],
        );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
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
                buildContainer(),
                const SizedBox(height: 60),
                const SizedBox(height: 30),
                const Text(
                  'Será enviado um código em seu Email para redefinição de senha',
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
                        switch (stage) {
                          case 0:
                            try {
                              await this
                                  .authController
                                  .sendEmail(emailController.text);
                              setState(() {
                                this.stage = 1;
                              });
                            } catch (err) {
                              Fluttertoast.showToast(
                                msg: err.toString().split(":")[1],
                                backgroundColor: Colors.red,
                              );
                            }

                            break;
                          case 1:
                            try {
                              await this.authController.changePassword(
                                  passController.text,
                                  newPassController.text,
                                  codeController.text);
                              Fluttertoast.showToast(
                                msg: "Senha modificada com sucesso!",
                                backgroundColor: Colors.green,
                              );
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            } catch (err) {
                              Fluttertoast.showToast(
                                msg: err.toString().split(":")[1],
                                backgroundColor: Colors.red,
                              );
                            }
                            break;
                        }
                      },
                      child: loading
                          ? SizedBox(
                              child: CircularProgressIndicator(
                                strokeWidth: 2.0,
                              ),
                              height: 15.0,
                              width: 15.0,
                            )
                          : Text(
                              'Enviar',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                    ),
                  ),
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
      String labelText, bool pass,
      {TextInputType type = TextInputType.text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(17.0)),
      ),
      child: TextField(
        keyboardType: type,
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
