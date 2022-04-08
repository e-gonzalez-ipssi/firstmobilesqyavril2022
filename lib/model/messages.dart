import 'package:cloud_firestore/cloud_firestore.dart';

//Création du model Message afin de déterminer l'id de l'envoyeur et de l'id de la personne qui reçoit le mail

class Message {
  String idMessage = "";
  String from = "";
  String to = "";
  String texte = "";
  DateTime sendmessage = DateTime.now();

  Message(DocumentSnapshot snapshot) {
    idMessage = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    from = map['from'];
    to = map['to'];
    texte = map['texte'];
    Timestamp timestamp = map["sendmessage"];
    sendmessage = timestamp.toDate();
  }
}
