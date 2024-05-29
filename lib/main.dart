import 'package:flutter/material.dart';
import 'package:listview_detayli_yemek_uygulamasi_flutter/Urunler.dart';
import 'package:listview_detayli_yemek_uygulamasi_flutter/yemekler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Menü'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future<List<Yemekler>> getirYemek() async{
    var yemekListesi = <Yemekler>[];
    
    var y1 = Yemekler(1, "Adana", "fotolar/adana.jpg", 34.57);
    var y2 = Yemekler(2, "Hamburger", "fotolar/burger.jpg", 56.75);
    var y3 = Yemekler(3, "Yayık Ayran", "fotolar/ayran.jpg", 13.0);
    var y4 = Yemekler(4, "Adana Şalgamı", "fotolar/salgam.jpg", 14.5);
    var y5 = Yemekler(5, "Paşa Sarması", "fotolar/pasasarma.jpg", 12.25);
    var y6 = Yemekler(6, "Krem Karamel", "fotolar/kremkaramel.jpg", 27.84);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:FutureBuilder<List<Yemekler>>(
        future: getirYemek(),
        builder: (context, snapshot){
          if(snapshot.hasData){

            var yemekler = snapshot.data;

            return ListView.builder(
              itemCount: yemekler!.length,
              itemBuilder: (context,index){
                var yemek = yemekler[index];

                return Card(
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                          width: 170,
                          height: 150,
                          child: Image.asset(yemek.yemek_foto_ismi),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(yemek.yemek_ismi, style: const TextStyle(fontSize: 25),),
                          const SizedBox(height: 50),
                          Text("${yemek.yemek_fiyat} \u{20BA}", style: const TextStyle(fontSize: 17),),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Urunler(yemek1: yemek,/*sozKonusuYemek: yemek.toString()*/),
                                ),
                             );
                           },
                        child: const Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                );
              },

            );


          }else{
            return const Center();
          }
        },
      ),
    );
  }
}
