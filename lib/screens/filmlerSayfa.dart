import 'package:film_uygulamasi/Filmler.dart';
import 'package:film_uygulamasi/Yonetmenler.dart';
import 'package:film_uygulamasi/screens/detaySayfa.dart';
import 'package:flutter/material.dart';

import '../Kategoriler.dart';

class FilmlerSayfa extends StatefulWidget {
  Kategoriler kategori;
   FilmlerSayfa({required this.kategori});

  @override
  State<FilmlerSayfa> createState() => _FilmlerSayfaState();
}

class _FilmlerSayfaState extends State<FilmlerSayfa> {

Future<List<Filmler>> filmleriGoster (int kategori_id) async{

  var filmListesi = <Filmler>[];

//Composition yapısı kullanacağımız için bir kategori bir de yonetmen nesnesi olusturduk
  var k1 = Kategoriler(1, "Komedi");
  var y1 = Yonetmenler(1, "Quentin Tarantino");
  
  //Filmler nesneleri olsutrduk
  var f1 = Filmler(1, "Anadoluda", 2008, "anadoluda.png", k1, y1);
  var f2 = Filmler(1, "Django", 2008, "django.png", k1, y1);
  var f3 = Filmler(1, "Inception", 2008, "inception.png", k1, y1);

  filmListesi.add(f1);
  filmListesi.add(f2);
  filmListesi.add(f3);



   return filmListesi;
}


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Filmler: ${widget.kategori.kategori_ad}"),
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder <List<Filmler>>(
        future: filmleriGoster(widget.kategori.kategori_id), 
        builder: (context,snapshot){
          

          if(snapshot.hasData){
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,//Bir satırda kaç tane item olacağını belirledik
                childAspectRatio: 2/ 3.5
                ),
              itemCount: filmlerListesi!.length,
              itemBuilder: (context ,index){
                var film = filmlerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> DetaySayfa(film: film,)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top:18.0),
                    child: Card(
                      color: Colors.indigo,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset("assets/images/${film.film_resim}"),
                          ),
                          Text(film.film_ad, style: TextStyle(color:Colors.white , fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                );
              }
              
              );
          }else{
            return Text("Veri Alınamadı.");
          }
        }
        ),
    );
  }
}