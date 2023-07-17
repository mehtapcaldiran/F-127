import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const Reset_Pas());

class Reset_Pas extends StatefulWidget {
  const Reset_Pas({super.key});

  @override
  State<Reset_Pas> createState() => _Reset_PasState();
}




class _Reset_PasState extends State<Reset_Pas> {

  bool pas_o = true;
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;


    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFD9F0F5),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFD9F0F5),
          leading: Container(
            padding: const EdgeInsets.only(left:5, top: 5),
            child: IconButton(
              onPressed: (){
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                size: 35,
                color: Color(0xFF1B5966B),
              ),
            ),
          ),
        ),
        body: SizedBox(
          height: pHeight,
          width: pWidth,
          child: Center(
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      const Positioned(
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
                        height: pHeight * 0.062,
                        width: pWidth * 0.8,
                        margin: const EdgeInsets.only(top: 240),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                Center(
                  child: SizedBox(
                    //padding: EdgeInsets.only(top: 100),
                    height: pHeight * 0.06,
                    width: pWidth * 0.8,
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
                        emailController.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Mail Doğru ise Şifre Sıfırlama Maili Gönderilecek',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Color(0xFF1B5966),
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                      child: const Text(
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
