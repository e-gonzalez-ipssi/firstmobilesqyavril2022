
import 'package:firstapplicationsqyavril2022/dashboard.dart';
import 'package:firstapplicationsqyavril2022/fonctions/firestoreHelper.dart';
import 'package:flutter/material.dart';

class registerPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    
    return registerPageState();
  }
}

class registerPageState extends State<registerPage>{

  late String mail;
  late String password;
  late String prenom;
  late String nom;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription")
        ),
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


  Widget bodyPage(){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
         hintText: "Saisissez votre prénom",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
        ),
        ),
        onChanged: (value){
          setState(() {
            prenom = value;
          });
        },
      ),
        const SizedBox(height: 10,),
        TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.person),
         hintText: "Saisissez votre nom",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
        ),
        ),
        onChanged: (value){
          setState(() {
            nom = value;
          });
        },
      ),
        const SizedBox(height: 10,),
         TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.mail),
         hintText: "Saisissez votre adresse mail",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
        ),
        ),
        onChanged: (value){
          setState(() {
            mail = value;
          });
        },
      ),
      const SizedBox(height: 10,),
       TextField(
          decoration: InputDecoration(
          prefixIcon: const Icon(Icons.lock_rounded),
         hintText: "Saisissez votre mot de passe",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
        ),
        ),
         obscureText: true,
         onChanged: (value){
           setState(() {
             password = value;
           });
         },
       ),
       const SizedBox(height: 10,),
       ElevatedButton(
         style: ElevatedButton.styleFrom(
           primary: Colors.amber,
           shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(10))
         ),
         onPressed: (){
          FirestoreHelper().register(mail, password, nom, prenom);
         }, 
         child: const Text("Inscription")
         )
      ],
    );
  }
}