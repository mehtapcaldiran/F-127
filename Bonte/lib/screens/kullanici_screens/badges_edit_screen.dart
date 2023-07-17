import 'package:flutter/material.dart';

void main() => runApp(const BadgesEdit());

class BadgesEdit extends StatefulWidget {
  const BadgesEdit({super.key});

  @override
  State<BadgesEdit> createState() => _BadgesEditState();
}

class _BadgesEditState extends State<BadgesEdit> {



  @override
  Widget build(BuildContext context) {

    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pop(context);
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
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xff1b5966b),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF8FB4BC),
                    Color(0xFFA1CAD3),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.8),
                    spreadRadius: 10,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              height: pHeight * 0.12,
              width: pWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.add_chart),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.add_chart),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.add_chart),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.add_chart),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: const Icon(Icons.add_chart),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  const SizedBox(height: 30,),
                  const Center(
                    child: Text('Rozetleriniz',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
                            iconSize: 50,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.ac_unit),
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
