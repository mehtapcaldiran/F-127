import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "App",
  home: Guest_Login(),
));

class Guest_Login extends StatefulWidget {
  const Guest_Login({super.key});

  @override
  State<Guest_Login> createState() => _Guest_LoginState();
}

class _Guest_LoginState extends State<Guest_Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Center(),
    );
  }
}
