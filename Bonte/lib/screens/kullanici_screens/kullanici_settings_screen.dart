import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const KullaniciSettings());

class KullaniciSettings extends StatefulWidget {
  const KullaniciSettings({super.key});

  @override
  State<KullaniciSettings> createState() => _KullaniciSettingsState();
}

class _KullaniciSettingsState extends State<KullaniciSettings> {
  @override
  Widget build(BuildContext context) {

    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFD9F0F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFD9F0F5),
        leading: Container(
          padding: const EdgeInsets.only(left:5, top: 5),
          child: IconButton(
            onPressed: (){
              context.go('/yourKullaniciProfile');
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xff1b5966b),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: pHeight * 0.08,),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              height: pHeight * 0.095,
              width: pWidth * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF61DAF5),
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
                child: const Text(
                  'Profil Ayarları',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              height: pHeight * 0.095,
              width: pWidth * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF61DAF5),
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
                child: const Text(
                  'Sergilenen Rozet Ayarları',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              height: pHeight * 0.095,
              width: pWidth * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF61DAF5),
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
                child: const Text(
                  'Sergilenen Peç Ayarları',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              height: pHeight * 0.095,
              width: pWidth * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF61DAF5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                },
                child: const Text(
                  'Gizlilik Ayarları',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              height: pHeight * 0.095,
              width: pWidth * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xFF61DAF5),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                },
                child: const Text(
                  'Diğer Ayarlar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF123B44),
                  ),
                ),
              ),
            ),
            SizedBox(height: pHeight * 0.08,),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              height: pHeight * 0.095,
              width: pWidth * 0.8,
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
                child: const Text(
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
