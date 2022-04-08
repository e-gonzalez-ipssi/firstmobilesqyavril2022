import 'package:flutter/material.dart';
import 'package:firstapplicationsqyavril2022/model/utilisateur.dart';

import 'controller/messageController.dart';
import 'fonctions/firestoreHelper.dart';

class detailPage extends StatefulWidget {
  Utilisateur user;
  Utilisateur monProfil;
  detailPage({
    Key? key,
    required this.user,
    required this.monProfil,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return detailState();
  }
}

class detailState extends State<detailPage> {

  var msgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Chat avec ${widget.user.prenom} ${widget.user.nom}")),
        body: Stack(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                child:  bodyPage(),
              ),
            )
          ],
        )
    );
  }

  Widget bodyPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          controller: msgController,
          decoration: InputDecoration(
            hintText: "Saisissez votre message",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        const SizedBox(height: 10,),
        ElevatedButton(
          onPressed: sendMessage,
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))
          ),
          child: Text('Envoyer'),
        ),
        const SizedBox(height: 10,),
        //Zone de chat
        Flexible(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: MessageController(widget.monProfil, widget.user),
            )),
      ],
    );
  }

  sendMessage() {
    if (msgController != null && msgController != "") {
      String text = msgController.text;
      FirestoreHelper().sendMessage(text, widget.user, widget.monProfil);
      setState(() {
        msgController.text = '';
      });
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }
}
