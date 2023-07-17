import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const SignUp());

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _selec = 0;




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
            padding: const EdgeInsets.only(left: 5, top: 5),
            child: IconButton(
              onPressed: () {
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
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 32,),
                      child: Row(
                        children: [
                          SizedBox(
                            height: pHeight * 0.04,
                            width: pWidth * 0.4,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  _selec == 0
                                      ? const Color(0xFFB3E1EB)
                                      : const Color(0xFF1B5966),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                  _selec == 0 ? const Color(0xFF1B5966) : Colors.white,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selec =
                                      0; // Kullanıcı butonuna tıklandığında _selec değerini güncelle
                                });
                              },
                              child: const Text(
                                'Kullanıcı',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 15),
                          SizedBox(
                            height: pHeight * 0.04,
                            width: pWidth * 0.4,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                  _selec == 1
                                      ? const Color(0xFFB3E1EB)
                                      : const Color(0xFF1B5966),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                      color: Colors.black,
                                      width: 1,
                                    ),
                                  ),
                                ),
                                foregroundColor: MaterialStateProperty.all<Color>(
                                  _selec == 1 ? const Color(0xFF1B5966) : Colors.white,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _selec =
                                      1;
                                });
                              },
                              child: const Text(
                                'Kurumsal',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _selec == 0 ? const SignupKullanici() : const SignupKurumsal(),
                  ],
                ),
              ),
            ),
        ),
    );
  }
}

class SignupKullanici extends StatefulWidget {
  const SignupKullanici({super.key});

  @override
  State<SignupKullanici> createState() => _SignupKullaniciState();
}


class _SignupKullaniciState extends State<SignupKullanici> {

  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pas = TextEditingController();

  String validityCheck() {
    String errors = "";
    if(_name.text == "") errors = "$errors\nİsmini girmelisin";
    if(_surname.text == "") errors = "$errors\nSoyismini girmelisin";
    if(_email.text == "") errors = "$errors\nMail girmelisin";
    if(_pas.text == "") errors = "$errors\nPas girmelisin";
    if(_pas.text.length < 6) errors = "$errors\nPas 6 karakter olmalı girmelisin";

    return errors;
  }

  @override
  Widget build(BuildContext context) {
    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Stack(
              children: [
                const Positioned(
                  top: 10,
                  left: 0,
                  child: Text(
                    'Ad',
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
                  margin: const EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: const Color(0xFF1B5966),),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
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
                  'Soyad',
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
                    controller: _surname,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
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
                  'Email',
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
                    controller: _email,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
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
                  'Şifre',
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
                    obscureText: true,
                    controller: _pas,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            height: pHeight * 0.12,
            width: pWidth * 0.7,
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
              onPressed: () async {
                String errors = validityCheck();

                if(errors != ""){
                  return;
                }
                try {
                  var userResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email.text, password: _pas.text);
                  final String userId = userResult.user!.uid;
                  final DocumentReference newuser = FirebaseFirestore.instance.collection('user').doc(userId);
                  await newuser.set({
                    'name': _name.text,
                    'surname': _surname.text,
                  }, SetOptions(merge: true));
                  context.push('/editKullaniciProfile');
                } catch (e) {
                }
              },
              child: const Text(
                'Kayıt Ol',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class SignupKurumsal extends StatefulWidget {
  const SignupKurumsal({super.key});

  @override
  State<SignupKurumsal> createState() => _SignupKurumsalState();
}

class _SignupKurumsalState extends State<SignupKurumsal> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pas = TextEditingController();

  String validityCheck() {
    String errors = "";
    if(_name.text == "") errors = "$errors\nİsmini girmelisin";
    if(_email.text == "") errors = "$errors\nMail girmelisin";
    if(_pas.text == "") errors = "$errors\nPas girmelisin";
    if(_pas.text.length < 6) errors = "$errors\nPas 6 karakter olmalı girmelisin";

    return errors;
  }

  @override
  Widget build(BuildContext context) {
    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Stack(
              children: [
                const Positioned(
                  top: 8,
                  left: 0,
                  child: Text(
                    'Kurum İsmi',
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
                  margin: const EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: const Color(0xFF1B5966),),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
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
                  'Kurum Maili',
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
                    controller: _email,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
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
                  'Şifre',
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
                    controller: _pas,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            height: pHeight * 0.12,
            width: pWidth * 0.7,
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
              onPressed: () async {
                String errors = validityCheck();

                if(errors != ""){
                  return;
                }
                try {
                  var userResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _email.text, password: _pas.text);
                  final String userId = userResult.user!.uid;
                  final DocumentReference newuser = FirebaseFirestore.instance.collection('user').doc(userId);
                  await newuser.set({
                    'name': _name.text,
                  }, SetOptions(merge: true));
                  context.push('/editKurumsalProfile');
                } catch (e) {
                }
              },
              child: const Text(
                'Kayıt Ol',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}







