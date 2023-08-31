import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shynder/store/User/user.store.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  List<String> images = [];
  UserStore userStore = UserStore();

  @override
  void initState() {
    super.initState();
    userStore.getValue();
  }

  Widget createImage(url) {
    return Stack(children: [
      Container(
        margin: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 300,
        child: Image.network(url, fit: BoxFit.fill),
      ),
      ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: Colors.grey.withOpacity(0.1),
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              child: Image.network(url),
            ),
          ),
        ),
      ),
    ]);
  }

  Widget renderImages() {
    return Container(
      color: Colors.black26,
      height: MediaQuery.of(context).size.height - 400,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return createImage(images[index]);
        },
      ),
    );
  }

  calculateAge(String? birth) {
    if (birth == null) {
      return 0;
    }
    DateTime birthDate = DateTime.parse(birth);
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  @override
  Widget build(BuildContext context) => Observer(
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      renderImages(),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userStore.user!.result.name,
                              style: TextStyle(fontSize: 26),
                            ),
                            calculateAge(userStore.user!.result.age) > 0
                                ? Text(
                                    ", ${calculateAge(userStore.user!.result.age)}.",
                                    style: TextStyle(fontSize: 18),
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      userStore.user!.result.bio != null
                          ? Container(
                              margin: EdgeInsets.only(
                                  top: 5, bottom: 30, left: 40, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(FontAwesomeIcons.heart, size: 20),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    userStore.user!.result.facul,
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      userStore.user!.result.facul != null
                          ? Container(
                              margin: EdgeInsets.only(
                                  bottom: 10, left: 40, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(FontAwesomeIcons.school, size: 15),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    userStore.user!.result.facul,
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      userStore.user!.result.ocupation != null
                          ? Container(
                              margin: EdgeInsets.only(
                                  bottom: 40, left: 40, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.work,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    userStore.user!.result.ocupation,
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          userStore.user!.result.facebook != null
                              ? IconButton(
                                  icon: Icon(
                                    Icons.facebook,
                                  ),
                                  onPressed: () async {
                                    String url =
                                        userStore.user!.result.facebook;
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Não foi possível acessar o link",
                                        backgroundColor: Colors.red,
                                      );
                                    }
                                  },
                                )
                              : Container(),
                          userStore.user!.result.instagram != null
                              ? IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.instagram,
                                  ),
                                  onPressed: () async {
                                    String url =
                                        userStore.user!.result.instagram;
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Não foi possível acessar o link",
                                        backgroundColor: Colors.red,
                                      );
                                    }
                                  },
                                )
                              : Container(),
                          userStore.user!.result.twitter != null
                              ? IconButton(
                                  icon: Icon(
                                    FontAwesomeIcons.twitter,
                                  ),
                                  onPressed: () async {
                                    String url = userStore.user!.result.twitter;
                                    if (await canLaunch(url)) {
                                      await launch(url);
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: "Não foi possível acessar o link",
                                        backgroundColor: Colors.red,
                                      );
                                    }
                                  },
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              );
          }
        },
      );
}
