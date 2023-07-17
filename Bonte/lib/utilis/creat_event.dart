import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../model_providers/badges_provider.dart';
import '../model_providers/events_provider.dart';
import '../model_providers/user_kullanici_provider.dart';
import 'badge_show.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
void main() => runApp(CreatEvent());

class CreatEvent extends ConsumerStatefulWidget {
  const CreatEvent({super.key});

  @override
  ConsumerState<CreatEvent> createState() => _EtkinlikInfoState();
}

class _EtkinlikInfoState extends ConsumerState<CreatEvent> {

  String? imageUrl = "";
  XFile? image;

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


    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
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
                              child: image != null
                                  ? Image.file(
                                File(image!.path),
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
                    ],
                  ),
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
