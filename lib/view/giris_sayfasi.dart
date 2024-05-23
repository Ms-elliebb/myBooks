import 'package:app1/view/kitaplar_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GirisSayfasi extends StatefulWidget {
  GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  TextEditingController _sifreController = TextEditingController();
  String _mevcutSifre = "";

  @override
  void initState() {
    super.initState();
    _sifreyiGetir();
  }

  Widget buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _mevcutSifre.isNotEmpty
                ? "Mevcut Şifreniz ile giriş yapın"
                : "Hoşgeldiniz! Bir şifre belirleyin",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _sifreController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: "Şifreyi giriniz",
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text(_mevcutSifre.isNotEmpty ? "Giriş yap" : "Kaydet"),
            onPressed: () {
              if (_mevcutSifre.isNotEmpty) {
                _girisYap(context);
              } else {
                _sifreyiKaydet();
              }
            },
          ),
        ],
      ),
    );
  }

  void _sifreyiKaydet() async {
    String girilenSifre = _sifreController.text;
    if (girilenSifre.isNotEmpty) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("sifre", girilenSifre);
      _kitaplarSayfasiniAc();
    }
  }

  void _sifreyiGetir() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String okunanDeger = prefs.getString("sifre") ?? "";
    setState(() {
      _mevcutSifre = okunanDeger;
    });
  }

  void _girisYap(BuildContext context) {
    if (_sifreController.text == _mevcutSifre) {
      _kitaplarSayfasiniAc();
    }
  }

  void _kitaplarSayfasiniAc() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return KitaplarSayfasi();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giriş Sayfası"),
      ),
      body: buildBody(),
    );
  }
}
