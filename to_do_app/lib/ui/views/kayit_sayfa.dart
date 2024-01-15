import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/kayit_sayfa_cubit.dart';
import 'package:to_do_app/ui/views/anasayfa.dart';

class KayitSayfa extends StatefulWidget {
  const KayitSayfa({super.key});

  @override
  State<KayitSayfa> createState() => _KayitSayfaState();
}

class _KayitSayfaState extends State<KayitSayfa> {
  var tfGorevAdi = TextEditingController();
  Color myColor = Color(0xFF1B4242);
  Color myColorq = Color(0xFF5C8374);
  Color myColorw = Color(0xFF9EC8B9);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myColorw,
      appBar: AppBar(title: const Text("Kaydet", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.black87, fontFamily: "KaushanScriptRegular")), backgroundColor: myColorw,),
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
              ElevatedButton(style: ElevatedButton.styleFrom(primary: myColorq),onPressed: (){
                context.read<KayitSayfaCubit>().kaydet(tfGorevAdi.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa()));

              }, child: const Text("Kaydet",style: TextStyle(color: Colors.white70,),)),
              SizedBox(height: 20),
              ElevatedButton(style: ElevatedButton.styleFrom(primary: myColorq),onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Anasayfaya Dön",style: TextStyle(color: Colors.white70,))),

            ],
          ),
        ),
      ),
    );
  }
}
