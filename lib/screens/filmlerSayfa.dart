import 'package:flutter/material.dart';

class FilmlerSayfa extends StatefulWidget {
  const FilmlerSayfa({super.key});

  @override
  State<FilmlerSayfa> createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Kategoriler"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              
            ],
          ),
        )
    );
  }
}