import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/gorevler.dart';
import 'package:to_do_app/data/repo/gorevlerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Gorevler>> {
  AnasayfaCubit(): super(<Gorevler>[]);

  var grepo = GorevlerDaoRepository();

  Future<void> gorevleriYukle() async {
   var liste = await grepo.gorevleriYukle();
   emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await grepo.ara(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int gorev_id) async {
    await grepo.sil(gorev_id);
    await gorevleriYukle();
  }

}