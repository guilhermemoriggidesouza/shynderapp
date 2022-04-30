import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Matches extends StatelessWidget {
  Matches({Key? key}) : super(key: key);
  List profiles = [
    {
      "url": "https://static.poder360.com.br/2021/07/faustao.png",
      "bio": "aaaa"
    },
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "bbb"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
    {"url": "https://static.poder360.com.br/2021/07/faustao.png", "bio": "ccc"},
  ];

  Widget renderMatch(matchInfos) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            matchInfos.url,
            height: 60.0,
            width: 60.0,
          ),
        ),
        title: Text(matchInfos.bio),
        trailing: Icon(Icons.more_vert),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Click para começar uma conversa"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: ListView.builder(
            itemCount: profiles.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return renderMatch(profiles[index]);
            },
          ),
        ),
      ),
    );
  }
}
