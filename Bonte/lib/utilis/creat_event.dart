import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
void main() => runApp(const CreatEvent());

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

    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;

    Future<void> pickImage() async {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() => this.image = imageTemp);
      } catch (e) {
        if (kDebugMode) {
          print('Failed to pick image: $e');
        }
      }
    }

    Future<void> pickImageFromCamera() async {
      try {
        var image = await ImagePicker().pickImage(source: ImageSource.camera);
        if (image == null) return;
        final imageTemp = XFile(image.path);
        setState(() => this.image = imageTemp);
      } catch (e) {
        if (kDebugMode) {
          print('Failed to pick image from camera: $e');
        }
      }
    }






    return Scaffold(
      backgroundColor: const Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
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
                  height: pHeight * 0.21,
                  width: pWidth,
                  child: Stack(
                    children: [
                      InkWell(
                        child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(40.0),
                              topLeft: Radius.circular(40.0),
                            ),
                            child: Container(
                              height: pHeight * 0.18,
                              width: pWidth,
                              decoration: const BoxDecoration(
                                color: Colors.grey, // Varsayılan bir renk veya diğer dekorasyonları ekleyebilirsiniz
                              ),
                              child: image != null
                                  ? Image.file(
                                File(image!.path),
                                fit: BoxFit.cover,
                              )
                                  : const ColoredBox(color: Colors.white12),
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
                    ],
                  ),
                ),
                Stack(
                  children: [
                    const Positioned(
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
                    const Positioned(
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
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                          maxLines: null,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
