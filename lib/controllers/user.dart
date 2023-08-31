import 'package:flutter/material.dart';
import 'package:shynder/models/user.dart';
import 'package:shynder/pages/login/login.dart';
import 'package:shynder/repositories/user.dart';

class UserController {
  UserRepository userRepository = UserRepository();
  static final validCharacters =
      RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");

  checkRegister(
    String nome,
    String email,
    String senha,
    String senhaconfirm,
    String login,
    BuildContext context,
  ) {
    if (nome.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Digite o seu nome completo")));
      return false;
    }
    if (email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Digite um email valido")));
      return false;
    }
    if (senha.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Digite sua senha")));
      return false;
    }
    if (senhaconfirm.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Confirme sua senha")));
      return false;
    }
    if (senha != senhaconfirm) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("As senhas não conferem")));
      return false;
    }
    if (senha.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("A Senha deve ter no minimo 8 caracteres")));
      return false;
    }
    if (senha == "12345678") {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Essa senha não pode ser utilizada")));
      return false;
    }
    if (senha.contains("123")) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Essa senha não pode ser utilizada, por ser muito facil de advinhar")));
      return false;
    }

    return true;
  }

  register(
    String name,
    String email,
    String password,
    String passwordConfirm,
    String login,
    String? bio,
    String? facul,
    String? ocupation,
    String? facebook,
    String? instagram,
    String? twitter,
    BuildContext context,
  ) async {
    try {
      if (checkRegister(
        name,
        email,
        password,
        passwordConfirm,
        login,
        context,
      )) {
        User user = User(
          name: name,
          email: email,
          login: login,
          password: password,
          bio: bio,
          facul: facul,
          ocupation: ocupation,
          facebook: facebook,
          instagram: instagram,
          twitter: twitter,
        );
        await userRepository.createUser(user);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    } on Exception catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString().split(":")[1])));
    }
  }
}
