import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shynder/componentes/AnimatedButton.dart';
import 'package:shynder/componentes/input.dart';
import 'package:shynder/controllers/user.dart';
import 'package:shynder/store/User/user.store.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  TextEditingController bioController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController proController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController ocupationController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController faculController = TextEditingController();
  TextEditingController facController = TextEditingController();
  List<String> images = [
    "https://static.poder360.com.br/2021/07/faustao.png",
    "https://static1.purepeople.com.br/articles/7/32/39/07/@/3652908-faustao-foi-operado-para-retirada-de-cat-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg"
  ];
  bool loading = false;
  UserController userController = UserController();
  UserStore userStore = UserStore();

  @override
  void initState() {
    super.initState();
    userStore.getValue();
  }

  Widget createImage(url) {
    return Container(
      child: Stack(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Image.network(url),
            ),
          ),
          SizedBox(
            height: 40.0,
            width: 40.0,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black26, //<-- SEE HERE
              child: IconButton(
                splashRadius: 12,
                padding: EdgeInsets.zero,
                color: Colors.white,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                icon: Icon(Icons.close_rounded),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderImages() {
    return Container(
      height: 300,
      child: PageView(
          children: images.map((image) => createImage(image)).toList()),
    );
  }

  addingPhotos() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 60,
        width: 60,
        child: AnimatedButton(Icons.add, () {}, 100.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (userStore.user == null) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 60),
            alignment: Alignment.center,
            child: Center(child: CircularProgressIndicator()),
          );
        }
        switch (userStore.user!.status) {
          case FutureStatus.pending:
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 60),
              alignment: Alignment.center,
              child: Center(child: CircularProgressIndicator()),
            );

          case FutureStatus.rejected:
            return Container(
              margin: const EdgeInsets.all(60),
              alignment: Alignment.center,
              child: Center(
                child: Text(
                    "Não foi possível carregar seu perfil, tente novamente mais tarde"),
              ),
            );
          case FutureStatus.fulfilled:
            return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    renderImages(),
                    addingPhotos(),
                    input(nameController, Icons.account_circle, 'Nome Inteiro*',
                        false),
                    const SizedBox(height: 15),
                    input(emailController, Icons.email, "Email*", false),
                    const SizedBox(height: 15),
                    input(loginController, Icons.person, 'Login*', false),
                    const SizedBox(height: 15),
                    input(faculController, FontAwesomeIcons.school, 'Faculdade',
                        false),
                    const SizedBox(height: 15),
                    input(
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
                    input(ocupationController, Icons.work, 'Trabalho/Cargo',
                        false),
                    const SizedBox(height: 15),
                    input(bioController, FontAwesomeIcons.heart, 'Bio', false,
                        isTextArea: true, minLines: 6),
                    const SizedBox(height: 15),
                    input(facebookController, FontAwesomeIcons.facebook,
                        'Facebook', false),
                    const SizedBox(height: 15),
                    input(instagramController, FontAwesomeIcons.instagram,
                        'Instagram', false),
                    const SizedBox(height: 15),
                    input(twitterController, FontAwesomeIcons.twitter,
                        'Twitter', false),
                    const SizedBox(height: 30),
                    MaterialButton(
                      elevation: 0,
                      minWidth: double.maxFinite,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      ),
                      height: 50,
                      onPressed: () async {
                        try {
                          setState(() {
                            this.loading = true;
                          });
                          await userController.edit(
                            nameController.text,
                            emailController.text,
                            loginController.text,
                            bioController.text,
                            ageController.text,
                            faculController.text,
                            ocupationController.text,
                            facebookController.text,
                            instagramController.text,
                            twitterController.text,
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
                      },
                      child: setUpButtonChild(),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            );
        }
      },
    );
  }

  Widget setUpButtonChild() {
    if (loading) {
      return const Text(
        'Criar conta',
        style: TextStyle(color: Colors.white, fontSize: 16),
      );
    } else if (loading) {
      return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return Icon(Icons.check, color: Colors.white);
    }
  }
}
