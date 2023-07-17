import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:bonte/screens/kurumsal_screens/your_kurumsal_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(EditKurumsalProfile());

class EditKurumsalProfile extends StatefulWidget {
  const EditKurumsalProfile({super.key});

  @override
  State<EditKurumsalProfile> createState() => _EditKurumsalProfileState();
}

class _EditKurumsalProfileState extends State<EditKurumsalProfile> {

  List<String> citys = <String>['İstanbul', 'Ankara', 'New York', 'Berlin', 'Paris'];

  late String _select_city = citys[0];

  String? loc = "";
  String? imageUrl = "";
  XFile? image;
  String? backgroundImageUrl = "";
  XFile? backgroundImage;
  List<dynamic> yourEvents = [];
  List<dynamic> member = [];
  List<dynamic> badges = [];
  List<dynamic> badges2 = [];
  List<dynamic> follow = [];

  TextEditingController _info = TextEditingController();



  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    Future<void> pickImage() async {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() => this.image = imageTemp);
      } catch (e) {
        print('Failed to pick image: $e');
      }
    }

    Future<void> pickImageFromCamera() async {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() => this.image = imageTemp);
      } catch (e) {
        print('Failed to pick image from camera: $e');
      }
    }


    Future<void> pickImage2() async {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() => this.backgroundImage = imageTemp);
      } catch (e) {
        print('Failed to pick image: $e');
      }
    }

    Future<void> pickImageFromCamera2() async {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() => this.backgroundImage = imageTemp);
      } catch (e) {
        print('Failed to pick image from camera: $e');
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
        print('Image URL: $imageUrl');
        return imageUrl; // imageUrl'ü döndür
      } catch (e) {
        print('Failed to upload image: $e');
        return ''; // Hata durumunda boş bir string döndür
      }
    }

    String validityCheck() {
      String errors = "";
      if(_info.text == "") errors = "$errors\nİnfo girmelisin";
      return errors;
    }


    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () async {
                String errors = validityCheck();

                if(errors != ""){
                  print(errors);
                  return;
                }
                if (image != null){
                  imageUrl = await uploadImageToFirebase(image!);
                }
                if (backgroundImage != null){
                  backgroundImageUrl = await uploadImageToFirebase(backgroundImage!);
                }

                try{
                  final String userId = FirebaseAuth.instance.currentUser!.uid;
                  final DocumentReference newuser = FirebaseFirestore.instance.collection('user').doc(userId);
                  await newuser.set({
                    'info': _info.text,
                    'image': imageUrl,
                    'backgroundImage': backgroundImageUrl,
                    'loc': _select_city,
                    'type': 1,
                    'yourEvents': yourEvents,
                    'member': member,
                    'follow': follow,
                    'badges': badges,
                    'badges2': badges2,
                    //'backgorundColor':
                  }, SetOptions(merge: true));
                  context.go('/yourKurumsalProfile');
                } catch (e) {
                  Text(e.toString());
                }

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
                    height: p_height * 0.21,
                    width: p_width,
                    child: Stack(
                      children: [
                        InkWell(
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                            ),
                            child: Container(
                              height: p_height * 0.18,
                              width: p_width,
                              decoration: BoxDecoration(
                                color: Colors.grey, // Varsayılan bir renk veya diğer dekorasyonları ekleyebilirsiniz
                              ),
                              child: backgroundImage != null
                                  ? Image.file(
                                File(backgroundImage!.path),
                                fit: BoxFit.cover,
                              )
                                  : ColoredBox(color: Colors.white12),
                            )
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
                                      onTap: () async {
                                        await pickImage2();
                                      },
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.camera_alt_outlined),
                                      title: Text('Kamera'),
                                      onTap: () async {
                                        await pickImageFromCamera2();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        Positioned(
                          top: p_height * 0.08,
                          left: p_width * 0.1,
                          child: InkWell(
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: image != null ? FileImage(File(image!.path)) : null,
                              backgroundColor: image != null ? Colors.transparent : Colors.grey,
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
                                        onTap: () async {
                                          await pickImage();
                                        },
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.camera_alt_outlined),
                                        title: Text('Kamera'),
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
                      ],
                    ),
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
                          'Kurum Telefonu',
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
                  Stack(
                    children: [
                      Positioned(
                        top: 21,
                        left: 0,
                        child: Text(
                          'Bağış Bilgileri',
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
                  Stack(
                    children: [
                      Positioned(
                        top: 21,
                        left: 0,
                        child: Text(
                          'Üyelik Bilgileri',
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
                  SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
