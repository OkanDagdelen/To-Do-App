import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/gorevler.dart';
import 'package:to_do_app/ui/cubit/anasayfa_cubit.dart';
import 'package:to_do_app/ui/cubit/detay_sayfa_cubit.dart';
import 'package:to_do_app/ui/views/anasayfa.dart';

class DetaySayfa extends StatefulWidget {
  Gorevler gorev;

  DetaySayfa({required this.gorev});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfGorevAdi = TextEditingController();


  @override
  void initState() {
    super.initState();
    var gorev = widget.gorev;
    tfGorevAdi.text = gorev.gorev_ad;
  }
  Color myColor = Color(0xFF1B4242);
  Color myColorq = Color(0xFF5C8374);
  Color myColorw = Color(0xFF9EC8B9);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: myColorw,
      appBar: AppBar(title: const Text("Detaylar", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.black87, fontFamily: "KaushanScriptRegular")),backgroundColor: myColorw,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(controller: tfGorevAdi, decoration: const InputDecoration(hintText: "Görev Ad"),),
              ),
              SizedBox(height: 20),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: myColorq,),onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));
                context.read<DetaySayfaCubit>().guncelle(widget.gorev.gorev_id, tfGorevAdi.text);
              }, child: const Text("Güncelle",style: TextStyle(color: Colors.white70,),)),
              SizedBox(height: 20),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: myColorq),onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Anasayfaya Dön",style: TextStyle(color: Colors.white70,))),
              SizedBox(height: 20),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: myColorq), onPressed: (){
                context.read<AnasayfaCubit>().sil(widget.gorev.gorev_id);
                Navigator.pop(context);
              }, child:const Text("Sil",style: TextStyle(color: Colors.white70,)),)
            ],
          ),
        ),
      ),
    );
  }
}
