import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/entity/gorevler.dart';
import 'package:to_do_app/ui/cubit/anasayfa_cubit.dart';
import 'package:to_do_app/ui/views/detay_sayfa.dart';
import 'package:to_do_app/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {


  bool aramaYapiliyorMu = false;

  Color myColor = Color(0xFF5C8374);
  Color myColorq = Color(0xFF1B4242);
  Color myColorw = Color(0xFF9EC8B9);
  Color myColorf = Color(0xFF092635);
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().gorevleriYukle();
  }
  @override
  Widget build(BuildContext context) {

    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: myColorw,
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().ara(aramaSonucu);
          },
        ) :
        const Text("TO DO", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: Colors.black87, fontFamily: "KaushanScriptRegular")), centerTitle: true,backgroundColor: myColorw,
        actions: [
          aramaYapiliyorMu ?
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = false;
            });
            context.read<AnasayfaCubit>().gorevleriYukle();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {
              aramaYapiliyorMu = true;
            });
          }, icon: const Icon(Icons.search,
            size: 30, // İstediğiniz büyüklük
            color: Colors.black,))
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<Gorevler>>(
          builder: (context, gorevlerListesi){
            if (gorevlerListesi.isNotEmpty) {
              return ListView.builder(
                itemCount: gorevlerListesi.length,
                itemBuilder: (context, indeks){
                  var gorev = gorevlerListesi[indeks];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  DetaySayfa(gorev: gorev)))
                          .then((value) {
                        print("Anasayfaya Dönüldü");
                      });
                    },
                    child: Card(
                      color: myColor,
                      child: SizedBox(height: 100,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(gorev.gorev_ad, style: const TextStyle(fontSize: 20,color: Colors.black87, fontFamily: "KaushanScriptRegular")),
                                ],
                              ),
                            ),
                            const Spacer(),
                            IconButton(onPressed: (){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("${gorev.gorev_ad} Silinsin Mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      context.read<AnasayfaCubit>().sil(gorev.gorev_id);
                                    },
                                  ),
                                  )
                              );
                            }, icon: const Icon(Icons.clear, color: Colors.red,))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }else{
              return const Center();
            }
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((value) {
            context.read<AnasayfaCubit>().gorevleriYukle();
          });
        },
        child: const Icon(Icons.add,color: Colors.white60,), backgroundColor: myColorq,
      ),
    );
  }
}
