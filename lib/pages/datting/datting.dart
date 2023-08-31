import 'package:flutter/material.dart';
import 'package:shynder/componentes/AnimatedButton.dart';

class Datting extends StatelessWidget {
  Datting({Key? key}) : super(key: key);
  List<String> images = [
    "https://static.poder360.com.br/2021/07/faustao.png",
    "https://static1.purepeople.com.br/articles/7/32/39/07/@/3652908-faustao-foi-operado-para-retirada-de-cat-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg"
  ];

  Widget createImage(url) {
    return Container(
        height: 60, child: Image.network(url, width: 50, height: 60));
  }

  List<Widget> renderImages() {
    return images.map((url) => createImage(url)).toList();
  }

  buildBio(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black38,
            Colors.black,
          ],
        ),
      ),
      child: Padding(
        child: Text("fofo\ntimido\ne ajeitadinho"),
        padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 130),
      ),
    );
  }

  buildCloseButton() {
    return AnimatedButton(Icons.close, () {}, 100);
  }

  buildLikeButton() {
    return AnimatedButton(Icons.favorite, () {}, 100);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Text("Fausto Silva, 13"),
          flexibleSpace: SafeArea(
            child: TabBar(
              tabs: <Widget>[
                Container(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: renderImages(),
            ),
            Positioned(left: 0.0, bottom: 0.0, child: buildBio(context)),
            Positioned(left: 15.0, bottom: 30.0, child: buildCloseButton()),
            Positioned(right: 30.0, bottom: 30.0, child: buildLikeButton())
          ],
        ),
      ),
    );
  }
}
