import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstapplicationsqyavril2022/model/utilisateur.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firstapplicationsqyavril2022/widgets/messages.dart';
import 'package:firstapplicationsqyavril2022/fonctions/firestoreHelper.dart';
import 'package:firstapplicationsqyavril2022/model/messages.dart';
import '../fonctions/firestoreHelper.dart';

class MessageController extends StatefulWidget {
  Utilisateur from;
  Utilisateur to;
  MessageController(this.from, this.to);

  @override
  State<StatefulWidget> createState() {
    return MessageControllerState();
  }
}

class MessageControllerState extends State<MessageController>
  with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat();
    animation = Tween<double>(begin: 10, end: 20).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreHelper()
            .fire_messages
            .orderBy('sendmessage', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else {
            List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (BuildContext ctx, int index) {
                  Message discussion = Message(documents[index]);
                  if ((discussion.from == widget.from.uid &&
                      discussion.to == widget.to.uid) ||
                      (discussion.from == widget.to.uid &&
                          discussion.to == widget.from.uid)) {
                    return messageBubble(
                      widget.from.uid,
                      widget.to,
                      discussion,
                      animation: animation,
                    );
                  } else {
                    return Container();
                  }
                });
          }
        });
  }
}
