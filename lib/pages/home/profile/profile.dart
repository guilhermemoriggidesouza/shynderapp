import 'package:flutter/material.dart';
import 'package:shynder/controllers/auth.dart';
import 'package:shynder/pages/home/profile/edit.dart';
import 'package:shynder/pages/home/profile/view.dart';
import 'package:shynder/pages/login/login.dart';

class Profile extends StatefulWidget {
  bool canEdit = false;
  Profile(this.canEdit);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool editMode = false;
  AuthController authController = AuthController();

  builEditButton() {
    return PopupMenuButton<String>(
      onSelected: (value) {
        switch (value) {
          case "Edit":
            setState(() {
              this.editMode = true;
            });
            break;
          case "Logout":
            authController.logout(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }, context);
            break;
        }
      },
      itemBuilder: (BuildContext context) {
        return {'Logout', 'Edit'}.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }

  builSaveButton() {
    return IconButton(
      iconSize: 35,
      onPressed: () {
        setState(() {
          this.editMode = false;
        });
      },
      icon: Icon(Icons.check),
    );
  }

  buildActionButton() {
    return Container(
        child: this.editMode ? builSaveButton() : builEditButton());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: editMode
            ? IconButton(
                onPressed: () {
                  setState(() {
                    this.editMode = false;
                  });
                },
                icon: Icon(Icons.arrow_back))
            : Icon(Icons.person),
        title: Text(editMode ? "Edite seu perfil" : "Perfil"),
        actions: [widget.canEdit ? buildActionButton() : Container()],
      ),
      body: Column(
        children: [editMode ? EditProfile() : ViewProfile()],
      ),
    );
  }
}
