import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(SignUp());

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _selec = 0;




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
            padding: EdgeInsets.only(left: 5, top: 5),
            child: IconButton(
              onPressed: () {
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
          child: Container(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 32,),
                          child: Row(
                            children: [
                              Container(
                                height: p_height * 0.04,
                                width: p_width * 0.4,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      _selec == 0
                                          ? Color(0xFFB3E1EB)
                                          : Color(0xFF1B5966),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    foregroundColor: MaterialStateProperty.all<Color>(
                                      _selec == 0 ? Color(0xFF1B5966) : Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _selec =
                                          0; // Kullanıcı butonuna tıklandığında _selec değerini güncelle
                                    });
                                  },
                                  child: Text(
                                    'Kullanıcı',
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                height: p_height * 0.04,
                                width: p_width * 0.4,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      _selec == 1
                                          ? Color(0xFFB3E1EB)
                                          : Color(0xFF1B5966),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        side: BorderSide(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    foregroundColor: MaterialStateProperty.all<Color>(
                                      _selec == 1 ? Color(0xFF1B5966) : Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _selec =
                                          1;
                                    });
                                  },
                                  child: Text(
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
                        _selec == 0 ? SignupKullanici() : SignupKurumsal(),
                      ],
                    ),
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

  TextEditingController _name = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pas = TextEditingController();

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
    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Stack(
              children: [
                Positioned(
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
                  height: p_height * 0.062,
                  width: p_width * 0.8,
                  margin: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xFF1B5966),),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7),
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
              Positioned(
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
              Positioned(
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
              Positioned(
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
            padding: EdgeInsets.only(
              top: 50,
            ),
            height: p_height * 0.12,
            width: p_width * 0.7,
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
              onPressed: () async {
                String errors = validityCheck();

                if(errors != ""){
                 print(errors);
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
                  print(e.toString());
                }
              },
              child: Text(
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
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pas = TextEditingController();

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
    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: Stack(
              children: [
                Positioned(
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
                  height: p_height * 0.062,
                  width: p_width * 0.8,
                  margin: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xFF1B5966),),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7),
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
              Positioned(
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
              Positioned(
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
            padding: EdgeInsets.only(
              top: 50,
            ),
            height: p_height * 0.12,
            width: p_width * 0.7,
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
              onPressed: () async {
                String errors = validityCheck();

                if(errors != ""){
                  print(errors);
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
                  print(e.toString());
                }
              },
              child: Text(
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







