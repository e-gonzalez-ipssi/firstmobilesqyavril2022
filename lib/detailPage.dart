import 'package:flutter/material.dart';
import 'package:firstapplicationsqyavril2022/model/utilisateur.dart';

class detailPage extends StatefulWidget {
  Utilisateur user;
  detailPage({required this.user});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailState();
  }
}

class detailState extends State<detailPage> {
  late String message;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text("Chat with ${widget.user.prenom} ${widget.user.nom}")),
        body: bodyPage());
  }

  Widget bodyPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Taper votre message",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onChanged: (value) {
            setState(() {
              message = value;
              // envoyer a la bd
              // reset la value du textfield
              // get la bd
            });
          },
        ),
        // liste des messages éxistant
      ],
    );
  }
}
