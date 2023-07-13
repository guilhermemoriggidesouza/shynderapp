import 'dart:ui';

import 'package:flutter/material.dart';

class ViewProfile extends StatefulWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  State<ViewProfile> createState() => _ViewProfileState();
}

class _ViewProfileState extends State<ViewProfile> {
  List<String> images = [
    "https://static.poder360.com.br/2021/07/faustao.png",
    "https://static1.purepeople.com.br/articles/7/32/39/07/@/3652908-faustao-foi-operado-para-retirada-de-cat-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg",
    "https://static1.purepeople.com.br/articles/8/32/03/28/@/3613491-faustao-levou-tombo-no-palco-do-dominga-624x600-1.jpg"
  ];

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          renderImages(),
          Container(
            margin: EdgeInsets.only(top: 20, bottom: 5),
            child: Text(
              "Fausto Silva, 45 Anos",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
            child: Text(
                "Oooooooooooooooooooooooooooooolllllllllllllloooooooooooooooooooooooooooooooooooooooooooko bicho!!!..., se vira nos 30 ai meu, ó a fera ai meu, está na hora agora das videooooosss cacetadas bichooooo",
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                Icons.facebook,
                size: 40,
              ),
              Icon(
                Icons.facebook,
                size: 40,
              ),
              Icon(
                Icons.facebook,
                size: 40,
              ),
            ],
          )
        ],
      ),
    );
  }
}
