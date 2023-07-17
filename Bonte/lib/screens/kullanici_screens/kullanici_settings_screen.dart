import 'package:bonte/route/route_names.dart';
import 'package:bonte/screens/kullanici_screens/badges_edit_screen.dart';
import 'package:bonte/screens/kullanici_screens/badges_two_edit_screen.dart';
import 'package:bonte/screens/kullanici_screens/kullanici_profile_settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(KullaniciSettings());

class KullaniciSettings extends StatefulWidget {
  const KullaniciSettings({super.key});

  @override
  State<KullaniciSettings> createState() => _KullaniciSettingsState();
}

class _KullaniciSettingsState extends State<KullaniciSettings> {
  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFD9F0F5),
        leading: Container(
          padding: EdgeInsets.only(left:5, top: 5),
          child: IconButton(
            onPressed: (){
              context.go('/yourKullaniciProfile');
            },
            icon: Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xFF1B5966B),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: p_height * 0.08,),
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              height: p_height * 0.095,
              width: p_width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF61DAF5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  context.push('/kullaniciProfileSettings');
                },
                child: Text(
                  'Profil Ayarları',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              height: p_height * 0.095,
              width: p_width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF61DAF5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  context.push('/badgesEdit');
                },
                child: Text(
                  'Sergilenen Rozet Ayarları',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              height: p_height * 0.095,
              width: p_width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF61DAF5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  context.push('/badgesTwoEdit');
                },
                child: Text(
                  'Sergilenen Peç Ayarları',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              height: p_height * 0.095,
              width: p_width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF61DAF5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                },
                child: Text(
                  'Gizlilik Ayarları',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              height: p_height * 0.095,
              width: p_width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Color(0xFF61DAF5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                },
                child: Text(
                  'Diğer Ayarlar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            SizedBox(height: p_height * 0.08,),
            Container(
              padding: EdgeInsets.only(
                top: 30,
              ),
              height: p_height * 0.095,
              width: p_width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.red,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                },
                child: Text(
                  'Çıkış Yap',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: null,
    );
  }
}
