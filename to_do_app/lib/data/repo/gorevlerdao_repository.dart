import 'package:to_do_app/data/entity/gorevler.dart';
import 'package:to_do_app/sqlite/veritabani_yardimcisi.dart';

class GorevlerDaoRepository {
  Future<void> kaydet(String gorev_ad) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniGorev = Map<String,dynamic>();
    yeniGorev["gorev_ad"] = gorev_ad;
    await db.insert("gorevler", yeniGorev);
  }

  Future<void> guncelle(int gorev_id, String gorev_ad) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenGorev = Map<String,dynamic>();
    guncellenenGorev["gorev_ad"] = gorev_ad;
    await db.update("gorevler", guncellenenGorev,where: "gorev_id = ?", whereArgs: [gorev_id]);
  }

  Future<void> sil(int gorev_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("gorevler",where: "gorev_id = ?", whereArgs: [gorev_id]);
  }

  Future<List<Gorevler>> gorevleriYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM gorevler");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Gorevler(gorev_id: satir["gorev_id"], gorev_ad: satir["gorev_ad"] );
    });
  }


  Future<List<Gorevler>> ara(String aramaKelimesi) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM gorevler WHERE gorev_ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Gorevler(gorev_id: satir["gorev_id"], gorev_ad: satir["gorev_ad"] );
    });
  }
}