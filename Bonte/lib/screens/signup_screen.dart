import 'package:bonte/screens/edit_profile_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "App",
  home: Sign_Up(),
));

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {

  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFFD9F0F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFD9F0F5),
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
            child: Center(
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Positioned(
                          top: 8,
                          left:0,
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
                          margin: const EdgeInsets.only(top: 25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
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
                          top: 21,
                          left:0,
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
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
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
                          top: 21,
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
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
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
                          top: 21,
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
                          margin: EdgeInsets.only(top: 40),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
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
                          top: 21,
                          child: Text(
                            'Şifre Tekrar',
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
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 50,),
                      height: p_height * 0.12,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Edit_Profile()),);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
