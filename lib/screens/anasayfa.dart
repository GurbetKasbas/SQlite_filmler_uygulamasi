import 'package:film_uygulamasi/Kategorilerdao.dart';
import 'package:film_uygulamasi/screens/filmlerSayfa.dart';
import 'package:flutter/material.dart';

import '../Kategoriler.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
//Kategoriler sınıfından nesne veren bir liste verir bu method
  Future<List<Kategoriler>> tumKategorileriGoster() async {
    //Kategorilerdao sınıfından tüm kategorileri alıp kategorilistesinde tuttuk
    var kategoriListesi = await Kategorilerdao().tumKategoriler();

    return kategoriListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Kategoriler"),
      ),
      body: FutureBuilder<List<Kategoriler>>(
          future: tumKategorileriGoster(),
          builder: (context, snapshot) {
            //Bu future yapısı bize içerinde kategoriler nesnesi olan bir liste döndürür.
            //Bu liste dolu mu boş mu kontrolu

            if (snapshot.hasData) {
              var kategoriListesi = snapshot.data;
              return ListView.builder(
                  itemCount: kategoriListesi!.length,
                  itemBuilder: (context, index) {
                    var kategori = kategoriListesi[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FilmlerSayfa(
                                      kategori: kategori,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Card(
                          color: Colors.indigoAccent,
                          child: SizedBox(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  kategori.kategori_ad,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Text("Veri Alınamadı.");
            }
          }),
    );
  }
}
