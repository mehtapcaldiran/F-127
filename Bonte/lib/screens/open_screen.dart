import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class OpeningPage extends StatefulWidget {
  const OpeningPage({super.key});

  @override
  State<OpeningPage> createState() => _OpeningPageState();
}

class _OpeningPageState extends State<OpeningPage> {



  @override
  Widget build(BuildContext context) {
    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF1B5966),
                      Color(0xFF104B57),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
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
                height: pHeight * 0.4,
                width: pWidth,
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.only(top: 90),
                    ),
                    Image.asset('assets/logos/logo.png'),
                    const SizedBox(height: 15,),
                    Image.asset('assets/logos/yazi_bonte.png'),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: pHeight * 0.06,
                  width: pWidth * 0.7,
                  margin: const EdgeInsets.only(top: 200,),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF1B5966),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    onPressed: (){
                      context.push('/login');
                    },
                    child: const Text(
                      'Giriş Yap',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: pHeight * 0.03,),
              Center(
                child: SizedBox(
                  height: pHeight * 0.06,
                  width: pWidth * 0.7,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF1B5966),),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                    onPressed: (){
                      context.push('/signUp');
                    },
                    child: const Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: pHeight * 0.1,),
              Center(
                child: TextButton.icon(
                  onPressed: (){
                    context.push('/guest');
                  },
                  icon: const Icon(
                    Icons.person,
                    size: 25,
                    color: Color(0xFF1B5966),
                  ),
                  label: const Text(
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
    );
  }
}
