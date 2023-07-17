import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const EditProfile());

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  List<String> citys = <String>['İstanbul', 'Ankara', 'New York', 'Berlin', 'Paris'];

  late String _select_city = citys[0];

  int sex = 0;
  String? loc = "";
  String? imageUrl = "";
  XFile? image;
  List<dynamic> eventsAttended = [];
  List<dynamic> member = [];
  List<dynamic> mainBadges = [];
  List<dynamic> badges = [];
  List<dynamic> badges2 = [];
  List<dynamic> badgesShowcase = [];
  List<dynamic> badges2Showcase = [];
  List<dynamic> follow = [];

  final TextEditingController _info = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;



    Future<void> pickImage() async {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() => this.image = imageTemp);
      } catch (e) {
      }
    }

    Future<void> pickImageFromCamera() async {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() => this.image = imageTemp);
      } catch (e) {
      }
    }



    Future<String> uploadImageToFirebase(XFile xfile) async {
      try {
        if (xfile == null) return '';
        final File imageFile = File(xfile.path);
        final String fileName = DateTime.now().millisecondsSinceEpoch.toString();
        final firebase_storage.Reference firebaseStorageRef =
        firebase_storage.FirebaseStorage.instance.ref().child('images/$fileName');
        await firebaseStorageRef.putFile(imageFile);
        final imageUrl = await firebaseStorageRef.getDownloadURL();
        return imageUrl; // imageUrl'ü döndür
      } catch (e) {
        return ''; // Hata durumunda boş bir string döndür
      }
    }

    String validityCheck() {
      String errors = "";
      if(_info.text == "") errors = "$errors\nİnfo girmelisin";
      return errors;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                String errors = validityCheck();

              if(errors != ""){
                return;
              }
              if (image != null){
                imageUrl = await uploadImageToFirebase(image!);
              }

              try{
                final String userId = FirebaseAuth.instance.currentUser!.uid;;
                final DocumentReference newuser = FirebaseFirestore.instance.collection('user').doc(userId);
                await newuser.set({
                  'info': _info.text,
                  'image': imageUrl,
                  'loc': _select_city,
                  'type': 0,
                  'eventsAttended': eventsAttended,
                  'member': member,
                  'mainBadges': mainBadges,
                  'follow': follow,
                  'badgesShowcase': badgesShowcase,
                  'badges2Showcase': badges2Showcase,
                  'badges': badges,
                  'badges2': badges2,
                  //'backgorundColor':
                }, SetOptions(merge: true));
                context.go('/yourKullaniciProfile');
              } catch (e) {
              }

              },
              child: const Text(
                  'Kaydet',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1b5966b),
                ),
              )
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xFFD9F0F5),
        leading: Container(
          padding: const EdgeInsets.only(left:5, top: 5),
          child: IconButton(
            onPressed: (){
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xff1b5966b),
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
                  SizedBox(
                    height: pHeight * 0.2,
                   width: pWidth * 0.5,
                   child: CircleAvatar(
                       backgroundColor: Colors.black,
                       radius: 120,
                       child: InkWell(
                         child: CircleAvatar(
                           backgroundImage: image != null ? FileImage(File(image!.path)) : null,
                           backgroundColor: image != null ? Colors.transparent : Colors.grey,
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
                                       leading: const Icon(Icons.photo),
                                       title: const Text('Galeri'),
                                       onTap: () async {
                                         await pickImage();
                                       },
                                     ),
                                     ListTile(
                                       leading: const Icon(Icons.camera_alt_outlined),
                                       title: const Text('Kamera'),
                                       onTap: () async {
                                         await pickImageFromCamera();
                                       },
                                     ),
                                   ],
                                 );
                               },
                           );
                         },
                       ),
                   ),
                  ),
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          'Cinsiyet',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(width: 30,),
                      Radio<int>(
                        value: 0,
                        groupValue: sex,
                        onChanged: (value) {
                          setState(() {
                            sex = value!;
                          });
                        },
                        fillColor: MaterialStateColor.resolveWith((states) => const Color(0xFF1B5966),),
                      ),
                      const Text(
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
                        fillColor: MaterialStateColor.resolveWith((states) => const Color(0xFF1B5966),),
                      ),
                      const Text(
                        'Kadın',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      const Positioned(
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
                        height: pHeight * 0.062,
                        width: pWidth * 0.8,
                        margin: const EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1, color: const Color(0xFF1B5966),),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              value: _select_city,
                              icon: const Icon(Icons.arrow_drop_down),
                              items: citys.map((String select) {
                                return DropdownMenuItem(
                                    value: select,
                                    child: Text(
                                        select,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                );
                            }).toList(),
                              onChanged: (String? newSelect){
                                setState(() {
                                  _select_city = newSelect!;
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
                      const Positioned(
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
                        height: pHeight * 0.062,
                        width: pWidth * 0.8,
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: const Color(0xFF1B5966),),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7),
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
                      const Positioned(
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
                        height: pHeight * 0.15,
                        width: pWidth * 0.8,
                        margin: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 1, color: const Color(0xFF1B5966),),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _info,
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
                    padding: const EdgeInsets.only(
                      top: 30,
                    ),
                    height: pHeight * 0.095,
                    width: pWidth * 0.8,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF1B5966),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.push('/badgesEdit');
                      },
                      child: const Text(
                        'Rozet Seç',
                        style: TextStyle(
                          fontSize: 20,
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
                          const Color(0xFF1B5966),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                      ),
                      onPressed: () {
                        context.push('/badgesTwoEdit');
                      },
                      child: const Text(
                        'Peç Seç',
                        style: TextStyle(
                          fontSize: 20,
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
                          const Color(0xFF1B5966),
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
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(40),
                            ),
                          ),
                          builder: (context) {
                            return const ColorSelect();
                          },
                        );
                      },
                      child: const Text(
                        'Arka Plan Rengi Seç',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
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
        padding: const EdgeInsets.only(top: 80),
        decoration: const BoxDecoration(
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
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 2, color: Colors.black),
                      backgroundColor: Colors.white,
                      elevation: 4,
                    ),
                    onPressed: (){
                    },
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 2, color: Colors.black),
                      elevation: 4,
                      backgroundColor: Colors.lime,
                    ),
                    onPressed: (){
                    },
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(width: 2, color: Colors.black),
                      elevation: 4,
                      backgroundColor: Colors.indigo,
                    ),
                    onPressed: (){
                    },
                    child: const SizedBox(
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.deepOrange,
                  ),
                  onPressed: (){
                  },
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.green,
                  ),
                  onPressed: (){
                  },
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: (){
                  },
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.teal,
                  ),
                  onPressed: (){
                  },
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.red,
                  ),
                  onPressed: (){
                  },
                  child: const SizedBox(
                    height: 50,
                    width: 50,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: const BorderSide(width: 2, color: Colors.black),
                    elevation: 4,
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: (){
                  },
                  child: const SizedBox(
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
