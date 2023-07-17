
import 'package:bonte/screens/popular_5_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


void main() => runApp(Guest_Login());

class Guest_Login extends ConsumerStatefulWidget {
  const Guest_Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Guest_Login> createState() => _Guest_LoginState();
}

class _Guest_LoginState extends ConsumerState<Guest_Login> {


  @override
  Widget build(BuildContext context) {
    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;


    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        title: Text('Populer 5 Post',
        style: TextStyle(
          color: Colors.black,
        ),),
        elevation: 0,
        backgroundColor: Color(0xFFD9F0F5),
        leading: Container(
          padding: EdgeInsets.only(left: 5, top: 5),
          child: IconButton(
            onPressed: () {
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
      body: Populer5(),
    );
  }
}
