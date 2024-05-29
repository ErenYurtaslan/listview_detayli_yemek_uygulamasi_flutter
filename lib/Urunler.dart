import 'package:flutter/material.dart';
import 'package:listview_detayli_yemek_uygulamasi_flutter/yemekler.dart';

class Urunler extends StatefulWidget {

  Yemekler yemek1;

 // String sozKonusuYemek;

  Urunler({required this.yemek1, /*required this.sozKonusuYemek*/});

  @override
  State<Urunler> createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.yemek1.yemek_ismi),
      ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Ürün Detayları",style: TextStyle(color: Colors.indigo, fontSize: 40, fontWeight: FontWeight.bold),),
              Image.asset(widget.yemek1.yemek_foto_ismi),
              Text("${widget.yemek1.yemek_fiyat} \u{20BA}", style: const TextStyle(fontSize: 28, color: Colors.indigo, fontWeight: FontWeight.bold),),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.lightBlueAccent,
                ),
                onPressed: (){
                  print("${widget.yemek1.yemek_ismi} siparişi verildi.");
                },
                child: const Text("Sipariş Ver"),
              ),
            ],
          ),

        ),
    );
  }
}
