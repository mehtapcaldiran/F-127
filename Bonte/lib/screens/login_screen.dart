import 'package:bonte/screens/home_screen.dart';
import 'package:bonte/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "App",
  home: Login_Page(),
));

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {


  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFF1B5966),
          leading: Container(
            padding: EdgeInsets.only(left:5, top: 5),
            child: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 35,
                color: Color(0xFF1B5966B),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: p_height,
            width: p_width,
            color: Color(0xFFD9F0F5),
            child: Center(
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
                    height: p_height * 0.32,
                    width: p_width,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 40),
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
                              backgroundColor: MaterialStateProperty.all(Color(0xFF1B5966),),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: (){},
                            child: Text(
                              'Kullanıcı',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15,),
                        Container(
                          height: p_height * 0.04,
                          width: p_width * 0.4,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Color(0xFF1B5966),),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            onPressed: (){},
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
                  Center(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 31,
                            left:0,
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
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.mail),
                              //labelText: "Mail",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 15,
                          left:0,
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
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              //labelText: "Mail",
                              border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Center(
                    child: Container(
                      height: p_height * 0.06,
                      width: p_width * 0.7,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color(0xFF1B5966),),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Home()),);
                        },
                        child: Text(
                          'Giriş',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Center(
                    child: TextButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Reset_Pas()),);
                      },
                      child: Text(
                        'Şifremi Unuttum',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF1B5966),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: p_height* 0.04,
                      width: p_width* 0.5,
                      padding: EdgeInsets.only(bottom: p_height * 0.005),
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.g_mobiledata),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF4285F4)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: (){},
                        label: Text(
                            'Google ile Giriş Yap',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
