import 'package:bonte/screens/guest_screen.dart';
import 'package:bonte/screens/login_screen.dart';
import 'package:bonte/screens/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FirstPage());
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bonte First Page',
      debugShowCheckedModeBanner: false,
      home: OpeningPage(),
    );
  }
}

class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {



  @override
  Widget build(BuildContext context) {
    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Center(
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
                height: p_height * 0.4,
                width: p_width,
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsetsDirectional.only(top: 90),
                    ),
                    Image.asset('assets/logos/logo.png'),
                    SizedBox(height: 15,),
                    Image.asset('assets/logos/yazi_bonte.png'),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: p_height * 0.06,
                  width: p_width * 0.7,
                    margin: EdgeInsets.only(top: 200,),
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
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Login_Page()),);
                      },
                      child: Text(
                          'Giriş Yap',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              SizedBox(height: p_height * 0.03,),
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Sign_Up()),);
                    },
                    child: Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: p_height * 0.1,),
              Center(
                child: TextButton.icon(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Guest_Login()),);
                    },
                    icon: Icon(
                      Icons.person,
                      size: 25,
                      color: Color(0xFF1B5966),
                    ),
                    label: Text(
                        'Giriş Yapmdan Devam Et',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1B5966),
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
