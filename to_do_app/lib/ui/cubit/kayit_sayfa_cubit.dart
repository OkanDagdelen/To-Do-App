import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/gorevlerdao_repository.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit(): super(0);

  var grepo = GorevlerDaoRepository();
  Future<void> kaydet(String gorev_ad) async {
    await grepo.kaydet(gorev_ad);
  }
}