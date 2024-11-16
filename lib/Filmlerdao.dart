import 'package:film_uygulamasi/Filmler.dart';
import 'package:film_uygulamasi/Kategoriler.dart';
import 'package:film_uygulamasi/Yonetmenler.dart';

import 'VeritabaniYardimcisi.dart';

class Filmlerdao {
  //Tüm filmleri alıyoruz

  Future<List<Filmler>> tumFilmlerByKategoriId(int kategori_id) async {
    //Veritabanına erişim
    var db = await VeritabaniYardimcisi.veritabaniErisim();

//Tüm kkategorileri getiren sorgu
    List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id and filmler.kategori_id = $kategori_id");

    return List.generate(maps.length, (i) {
      //map'in içerisini satır satır aldık
      var satir = maps[i];

//Kategoriler yonetmenler ve filmler nesnesini olusturduk
      var k = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var y = Yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);
      var f = Filmler(satir["film_id"], satir["film_ad"], satir["film_yil"],
          satir["film_resim"], k, y);

      return f;
    });
  }
}
