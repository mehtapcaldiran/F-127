import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: "App",
  home: Reset_Pas(),
));

class Reset_Pas extends StatefulWidget {
  const Reset_Pas({super.key});

  @override
  State<Reset_Pas> createState() => _Reset_PasState();
}

class _Reset_PasState extends State<Reset_Pas> {
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
        body: Container(
          height: p_height,
          width: p_width,
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Positioned(
                        top: 221,
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
                        margin: EdgeInsets.only(top: 240),
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
                SizedBox(height: 50,),
                Center(
                  child: Container(
                    //padding: EdgeInsets.only(top: 100),
                    height: p_height * 0.06,
                    width: p_width * 0.8,
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
                      },
                      child: Text(
                        'Şifre Yenileme Maili Gönder',
                        style: TextStyle(
                          fontSize: 18,
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
    );
  }
}
