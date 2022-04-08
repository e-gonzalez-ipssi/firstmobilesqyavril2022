import 'package:firstapplicationsqyavril2022/widgets/Custom.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return backgroundState();
  }

}

class backgroundState extends State<Background> with SingleTickerProviderStateMixin{
  late Animation animation;
  late AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    controller = AnimationController(
        vsync: this,
      duration: Duration(seconds: 10)
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: bodyPage(),
    );
  }


  Widget bodyPage(){
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0,end:120),
      duration: Duration(seconds:8),
      curve: Curves.bounceInOut,
      child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.amber,
        ),

      builder: (context, value, child) {
        return ClipPath(
          clipper: Custom(value),
          child: child
        );



      },

    );


  }

}