import 'package:bonte/screens/kullanici_screens/your_kullanici_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(KullaniciProfileSettings());

class KullaniciProfileSettings extends StatefulWidget {
  const KullaniciProfileSettings({super.key});

  @override
  State<KullaniciProfileSettings> createState() => _KullaniciProfileSettingsState();
}

class _KullaniciProfileSettingsState extends State<KullaniciProfileSettings> {

  List<String> citys = <String>['İstanbul', 'Ankara', 'New York', 'Berlin', 'Paris'];

  late String _select_city = citys[0];

  int sex = 0;

  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                context.pop();
              },
              child: Text(
                'Kaydet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1B5966B),
                ),
              )
          ),
        ],
        elevation: 0,
        backgroundColor: Color(0xFFD9F0F5),
        leading: Container(
          padding: EdgeInsets.only(left:5, top: 5),
          child: IconButton(
            onPressed: (){
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xFF1B5966B),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: p_height * 0.2,
                  width: p_width * 0.5,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 120,
                    child: InkWell(
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 72,
                      ),
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: Icon(Icons.photo),
                                  title: Text('Galeri'),
                                  onTap: (){},
                                ),
                                ListTile(
                                  leading: Icon(Icons.camera_alt_outlined),
                                  title: Text('Kamera'),
                                  onTap: (){},
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Cinsiyet',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(width: 30,),
                    Radio<int>(
                      value: 0,
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value!;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF1B5966),),
                    ),
                    Text(
                      'Erkek',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Radio<int>(
                      value: 1,
                      groupValue: sex,
                      onChanged: (value) {
                        setState(() {
                          sex = value!;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith((states) => Color(0xFF1B5966),),
                    ),
                    Text(
                      'Kadın',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 31,
                      left: 0,
                      child: Text(
                        'Şehir',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5966),
                        ),
                      ),
                    ),
                    Container(
                      height: p_height * 0.062,
                      width: p_width * 0.8,
                      margin: const EdgeInsets.only(top: 50),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Color(0xFF1B5966),),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: _select_city,
                            icon: Icon(Icons.arrow_drop_down),
                            items: citys.map((String select) {
                              return DropdownMenuItem(
                                value: select,
                                child: Text(
                                  select,
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? new_select){
                              setState(() {
                                _select_city = new_select!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 21,
                      left: 0,
                      child: Text(
                        'Telefon',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5966),
                        ),
                      ),
                    ),
                    Container(
                      height: p_height * 0.062,
                      width: p_width * 0.8,
                      margin: EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Color(0xFF1B5966),),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(7),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: [
                    Positioned(
                      top: 21,
                      left: 0,
                      child: Text(
                        'Açıklama',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5966),
                        ),
                      ),
                    ),
                    Container(
                      height: p_height * 0.15,
                      width: p_width * 0.8,
                      margin: EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Color(0xFF1B5966),),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                        ),
                      ),
                    ),
                  ],
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
                        Color(0xFF1B5966),
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(40),
                          ),
                        ),
                        builder: (context) {
                          return Container(
                            //height: 110,
                            child: ColorSelect(),

                          );
                        },
                      );
                    },
                    child: Text(
                      'Arka Plan Rengi Seç',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class ColorSelect extends StatefulWidget {
  const ColorSelect({super.key});

  @override
  State<ColorSelect> createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        padding: EdgeInsets.only(top: 80),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),),
          gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.pink,
                Colors.indigoAccent,
                Colors.green,
              ]
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.black),
                      backgroundColor: Colors.white,
                      elevation: 4,
                    ),
                    onPressed: (){
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.black),
                      elevation: 4,
                      backgroundColor: Colors.lime,
                    ),
                    onPressed: (){
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(width: 2, color: Colors.black),
                      elevation: 4,
                      backgroundColor: Colors.indigo,
                    ),
                    onPressed: (){
                    },
                    child: SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: (){
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: (){
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: (){
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.teal,
                  ),
                  onPressed: (){
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: (){
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: (){
                  },
                  child: SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}