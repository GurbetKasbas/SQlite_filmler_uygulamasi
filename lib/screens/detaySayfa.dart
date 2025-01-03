import 'package:flutter/material.dart';

import '../Filmler.dart';

class DetaySayfa extends StatefulWidget {

  Filmler film;
  DetaySayfa({required this.film});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(widget.film.film_ad),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/${widget.film.film_resim}.png"),
              Text(widget.film.film_yil.toString() , style: TextStyle(fontSize: 30),),
              Text(widget.film.yonetmen.yonetmen_ad , style: TextStyle(fontSize: 30),)
            ],
          ),
        )
    );
  }
}