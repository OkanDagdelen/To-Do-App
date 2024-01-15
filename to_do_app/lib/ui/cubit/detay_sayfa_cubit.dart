import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/gorevlerdao_repository.dart';

class DetaySayfaCubit extends Cubit {
  DetaySayfaCubit():super(0);

  var grepo = GorevlerDaoRepository();

  Future<void> guncelle(int gorev_id, String gorev_ad) async {
    await grepo.guncelle(gorev_id, gorev_ad);
  }
}