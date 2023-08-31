import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:shynder/controllers/user.dart';
import 'package:shynder/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController twitterController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();
  final TextEditingController facebookController = TextEditingController();
  final TextEditingController faculController = TextEditingController();
  final TextEditingController ocupationController = TextEditingController();
  final TextEditingController loginController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  bool _switchValue = false;
  int _state = 0;
  UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          alignment: Alignment.topCenter,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Cria sua conta',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontFamily: 'OpenSans',
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'Crie sua conta para ter acesso completo a todas as funcionalidades e recursos disponiveis no app.',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 14, fontFamily: 'OpenSans'),
                ),
                const SizedBox(
                  height: 27,
                ),
                _buildTextField(
                    nameController, Icons.account_circle, 'Nome Inteiro*', false),
                const SizedBox(height: 15),
                _buildTextField(EmailController, Icons.email, "Email*", false),
                const SizedBox(height: 15),
                _buildTextField(loginController, Icons.person, 'Login*', false),
                const SizedBox(height: 15),
                _buildTextField(passwordController, Icons.lock, 'Senha*', true),
                const SizedBox(height: 15),
                _buildTextField(passwordConfirmController, Icons.lock,
                    'Confirme sua senha*', true),
                const SizedBox(height: 15),
                _buildTextField(faculController, FontAwesomeIcons.school,
                    'Faculdade', false),
                const SizedBox(height: 15),
                _buildTextField(
                  ageController,
                  FontAwesomeIcons.birthdayCake,
                  'Aniversário',
                  false,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      setState(() {
                        ageController.text = formattedDate;
                      });
                    }
                  },
                ),
                const SizedBox(height: 15),
                _buildTextField(
                    ocupationController, Icons.work, 'Trabalho/Cargo', false),
                const SizedBox(height: 15),
                _buildTextField(
                    bioController, FontAwesomeIcons.heart, 'Bio', false,
                    isTextArea: true, minLines: 6),
                const SizedBox(height: 15),
                _buildTextField(facebookController, FontAwesomeIcons.facebook,
                    'Facebook', false),
                const SizedBox(height: 15),
                _buildTextField(instagramController, FontAwesomeIcons.instagram,
                    'Instagram', false),
                const SizedBox(height: 15),
                _buildTextField(twitterController, FontAwesomeIcons.twitter,
                    'Twitter', false),
                const SizedBox(height: 30),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  ),
                  height: 50,
                  onPressed: () {
                    userController.register(
                      nameController.text,
                      EmailController.text,
                      passwordController.text,
                      passwordConfirmController.text,
                      loginController.text,
                      bioController.text,
                      ageController.text,
                      faculController.text,
                      ocupationController.text,
                      facebookController.text,
                      instagramController.text,
                      twitterController.text,
                      context,
                    );
                  },
                  child: setUpButtonChild(),
                  textColor: Colors.white,
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget setUpButtonChild() {
    if (_state == 0) {
      return const Text('Criar conta',
          style: TextStyle(color: Colors.white, fontSize: 16));
    } else if (_state == 1) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }

  void animateButton() {
    setState(() {
      _state = 1;
    });

    Timer(Duration(milliseconds: 3300), () {
      setState(() {
        _state = 2;
      });
    });
  }

  _buildFooterLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Cadastrar',
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
  }

  _buildTextField(TextEditingController controller, IconData icon,
      String labelText, bool pass,
      {isTextArea = false, minLines = 1, onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(17.0)),
      ),
      child: TextField(
        controller: controller,
        obscureText: pass,
        onTap: onTap,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          labelText: labelText,
          labelStyle: const TextStyle(
            color: Colors.white24,
            fontFamily: 'OpenSans',
          ),
          icon: Icon(
            icon,
            color: Colors.white,
          ),
          border: InputBorder.none,
        ),
        keyboardType:
            isTextArea && !pass ? TextInputType.multiline : TextInputType.text,
        minLines: minLines,
        maxLines: pass ? 1 : 6,
      ),
    );
  }
}
