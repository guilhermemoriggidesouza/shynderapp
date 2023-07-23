import 'package:flutter/material.dart';
import 'package:shynder/pages/home/profile/edit.dart';
import 'package:shynder/pages/home/profile/view.dart';

class Profile extends StatefulWidget {
  bool canEdit = false;
  Profile(this.canEdit);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool editMode = false;
  builEditButton() {
    return IconButton(
      iconSize: 35,
      onPressed: () {
        setState(() {
          this.editMode = !this.editMode;
        });
      },
      icon: Icon(Icons.edit_note),
    );
  }

  builSaveButton() {
    return IconButton(
      iconSize: 35,
      onPressed: () {
        setState(() {
          this.editMode = !this.editMode;
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
        title: Text(editMode ? "Edite seu perfil" : "Perfil"),
        actions: [widget.canEdit ? buildActionButton() : Container()],
      ),
      body: Column(
        children: [editMode ? EditProfile() : ViewProfile()],
      ),
    );
  }
}
