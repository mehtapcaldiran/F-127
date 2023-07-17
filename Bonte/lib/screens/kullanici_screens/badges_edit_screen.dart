import 'package:flutter/material.dart';

void main() => runApp(BadgesEdit());

class BadgesEdit extends StatefulWidget {
  const BadgesEdit({super.key});

  @override
  State<BadgesEdit> createState() => _BadgesEditState();
}

class _BadgesEditState extends State<BadgesEdit> {



  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
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
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF8FB4BC),
                    Color(0xFFA1CAD3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
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
              height: p_height * 0.12,
              width: p_width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.add_chart),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.add_chart),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.add_chart),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.add_chart),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.add_chart),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  SizedBox(height: 30,),
                  Center(
                    child: Text('Rozetleriniz',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
