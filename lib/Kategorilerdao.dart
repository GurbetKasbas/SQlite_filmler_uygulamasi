
import 'package:film_uygulamasi/Kategoriler.dart';
import 'package:film_uygulamasi/VeritabaniYardimcisi.dart';

class Kategorilerdao{

//Tüm kategorileri alacağımız method
Future<List<Kategoriler>> tumKategoriler () async {

  //Veritabanına erişim
  var db = await VeritabaniYardimcisi.veritabaniErisim();

//Tüm kkategorileri getiren sorgu
  List<Map<String, dynamic>> maps =  await db.rawQuery("SELECT * FROM kategoriler");

  return List.generate(maps.length, (i){
    //map'in içerisini satır satır aldık
    var satir = maps[i];
    return Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
  });
}
}