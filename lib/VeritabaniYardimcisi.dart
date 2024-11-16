import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class VeritabaniYardimcisi {
  static final String veritabaniAdi = "filmler.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);

//Veritabani var mı yok mu kontol
    if (await databaseExists(veritabaniYolu)) {
      print("Veritabani zaten var.Kopyalamaya gerek yok");
    } else {
      //asetten veritabanının alınması
      ByteData data = await rootBundle.load("veritabani/filmler.sqlite");
      //Veritabanın kopyalanması için byte dönüşümü
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      //Veritabanın kopyalanması
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veri tabanı kopyalandı");
    }

    //Veritabanını açıyoruz
    return openDatabase(veritabaniYolu);
  }
}
