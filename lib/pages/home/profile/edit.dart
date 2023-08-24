import 'package:flutter/material.dart';
import 'package:shynder/componentes/AnimatedButton.dart';
import 'package:shynder/componentes/input.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  TextEditingController bioController = TextEditingController()
    ..text = 'Advogato';
  TextEditingController nameController = TextEditingController()
    ..text = 'Advogato';
  TextEditingController proController = TextEditingController()
    ..text = 'Advogato';
  TextEditingController ageController = TextEditingController()..text = '0';
  TextEditingController facController = TextEditingController()..text = '0';
  List<String> images = [
    "https://static.poder360.com.br/2021/07/faustao.png",
    "https://static1.purepeople.com.br/articles/7/32/39/07/@/3652908-faustao-foi-operado-para-retirada-de-cat-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg"
  ];
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
    return Column(
      children: [
        renderImages(),
        addingPhotos(),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            Expanded(flex: 7, child: input(nameController, "Nome", () {})),
            Expanded(flex: 3, child: input(ageController, "Idade", () {}))
          ]),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: input(proController, "Ocupação", () {}),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: input(facController, "Faculdade", () {}),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: input(bioController, "Bio", () {}),
        ),
      ],
    );
  }
}
