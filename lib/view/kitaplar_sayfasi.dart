import 'package:app1/model/kitap.dart';
import 'package:flutter/material.dart';




class KitaplarSayfasi extends StatelessWidget {
  const KitaplarSayfasi({super.key});

Future<String?> _pencereAc(BuildContext context, String baslik) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      String sonuc = "";
      return AlertDialog(
        title: Text(baslik),
        content: TextField(
          keyboardType: TextInputType.text,
          onChanged: (String inputText) {
            sonuc = inputText;
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context, "");
            },
            child: Text("İptal"),
          ),
          TextButton(
            child: Text("Onayla"),
            onPressed: () {
              Navigator.pop(context, sonuc.trim());
            },
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Kitaplar Sayfası"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _kitapEkle(context);
        },
        ),
        
        
    );
    
  }void _kitapEkle(BuildContext context)async {
    String kitapAdi= await _pencereAc(context, "Kitap adını giriniz") ?? "";

    if(kitapAdi.isNotEmpty){
      Kitap yeniKitap=Kitap(kitapAdi, DateTime.now());
    }
   
  }
}

