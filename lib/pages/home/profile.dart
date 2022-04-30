import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shynder/componentes/AnimatedButton.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);
  List<String> images = [
    "https://static.poder360.com.br/2021/07/faustao.png",
    "https://static1.purepeople.com.br/articles/7/32/39/07/@/3652908-faustao-foi-operado-para-retirada-de-cat-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg"
  ];
  TextEditingController bioController = TextEditingController()..text = 'Advogato';


  Widget createImage(url) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Image.network(url),
    );
  }

  Widget renderImages() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return createImage(images[index]);
        },
      ),
    );
  }

  addingPhotos() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 60,
        child: AnimatedButton(Icons.add, () {}),
      ),
    );
  }


  changeBio(canChange) {
    if (canChange) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: TextField(
          controller: bioController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Bio',
          ),
        ),
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Edite seu perfil"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            renderImages(),
            addingPhotos(),
            changeBio(true)
          ],
        ),
      ),
    );
  }
}
