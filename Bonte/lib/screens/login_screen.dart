import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(Login_Page());

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  int _selec = 0;

  bool pas_o = true;
  final pasController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pasController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    pasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF1B5966),
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
          child: Container(
              height: p_height,
              width: p_width,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF1B5966),
                                Color(0xFF104B57),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(35),
                              bottomRight: Radius.circular(35),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 10,
                                blurRadius: 10,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          height: p_height * 0.335,
                          width: p_width,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(top: 30),
                              ),
                              Image.asset('assets/logos/logo.png'),
                              SizedBox(height: 15,),
                              Image.asset('assets/logos/yazi_bonte.png'),
                            ],
                          ),
                        ),
                        SizedBox(height: p_height * 0.04,),
                        Padding(
                          padding: EdgeInsets.only(left: 32),
                          child: Row(
                            children: [
                              Container(
                                height: p_height * 0.04,
                                width: p_width * 0.4,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                      _selec == 0 ? Color(0xFFB3E1EB) : Color(0xFF1B5966),
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                                      _selec = 0;
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
                                      _selec == 1 ? Color(0xFFB3E1EB) : Color(0xFF1B5966),
                                    ),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
                                      _selec = 1;
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
                        _selec == 0 ? Login_Kullanici() : Login_Kurumsal(),
                      ],
                    ),
                  ),
                ),
              ),
        ),
    );
  }
}


class Login_Kullanici extends StatefulWidget {
  const Login_Kullanici({super.key});

  @override
  State<Login_Kullanici> createState() => _Login_KullaniciState();
}

class _Login_KullaniciState extends State<Login_Kullanici> {

  TextEditingController _email = TextEditingController();
  TextEditingController _pas = TextEditingController();

  String validityCheck() {
    String errors = "";
    if(_email.text == "") errors = "$errors\nMail girmelisin";
    if(_pas.text == "") errors = "$errors\nPas girmelisin";

    return errors;
  }

  bool pas_o = true;

  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: [
          Stack(
              children: [
                Positioned(
                  top: 31,
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
                  margin: const EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xFF1B5966),),
                  ),
                  child: TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          Stack(
              children: [
                Positioned(
                  top: 15,
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
                  margin: const EdgeInsets.only(top: 35),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xFF1B5966),),
                  ),
                  child: TextFormField(
                    controller: _pas,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
                        icon: Icon(
                          pas_o ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            pas_o = !pas_o;
                          });
                        },
                      ),
                    ),
                    obscureText: pas_o,
                  ),
                ),
              ],
            ),
          SizedBox(
            height: 30,
          ),
          Container(
              height: p_height * 0.06,
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

                  try{
                    final UserResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email.text, password: _pas.text);
                    print(UserResult.user!.email);
                    context.go('/');
                  } catch (e) {
                    print(e);
                  }

                },
                child: Text(
                  'Giriş',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                context.push('/resetPassword');
              },
              child: Text(
                'Şifremi Unuttum',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1B5966),
                ),
              ),
            ),
          Container(
              height: p_height * 0.04,
              width: p_width * 0.5,
              //padding: EdgeInsets.only(bottom: p_height * 0.005),
              child: ElevatedButton.icon(
                icon: Icon(Icons.g_mobiledata),
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Color(0xFF4285F4)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {},
                label: Text(
                  'Google ile Giriş Yap',
                ),
              ),
            ),
          SizedBox(height: 8,),
        ],
      ),
    );
  }
}



class Login_Kurumsal extends StatefulWidget {
  const Login_Kurumsal({super.key});

  @override
  State<Login_Kurumsal> createState() => _Login_KurumsalState();
}

class _Login_KurumsalState extends State<Login_Kurumsal> {

  TextEditingController _email = TextEditingController();
  TextEditingController _pas = TextEditingController();

  String validityCheck() {
    String errors = "";
    if(_email.text == "") errors = "$errors\nMail girmelisin";
    if(_pas.text == "") errors = "$errors\nPas girmelisin";

    return errors;
  }

  bool pas_o = true;

  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return Center(
          child: Column(
            children: [
              Stack(
                  children: [
                    Positioned(
                      top: 31,
                      left: 0,
                      child: Text(
                        'Kurum Mail',
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
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Color(0xFF1B5966),),
                      ),
                      child: TextFormField(
                        controller: _email,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            border: InputBorder.none,
                          ),
                        ),

                    ),
                  ],
                ),
               Stack(
                  children: [
                    Positioned(
                      top: 15,
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
                      margin: const EdgeInsets.only(top: 35),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Color(0xFF1B5966),),
                      ),
                      child: TextFormField(
                        controller: _pas,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              icon: Icon(
                                pas_o ? Icons.visibility_off : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  pas_o = !pas_o;
                                });
                              },
                            ),
                          ),
                          obscureText: pas_o,
                        ),
                    ),
                  ],
                ),
              SizedBox(
                height: 30,
              ),
              Container(
                  height: p_height * 0.06,
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

                      try{
                        final UserResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _email.text, password: _pas.text);
                        print(UserResult.user!.email);
                        context.go('/');
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text(
                      'Giriş',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Lütfen Kurum Maili ile İletişime Geçin',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        backgroundColor: Color(0xFF1B5966),
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: Text(
                    'Şifremi Unuttum',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1B5966),
                    ),
                  ),
                ),
              SizedBox(height: 40,),
            ],
          ),
    );
  }
}

