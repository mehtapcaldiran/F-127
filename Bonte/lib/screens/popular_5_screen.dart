import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model_providers/post_provider.dart';


class Populer5 extends ConsumerStatefulWidget {
  const Populer5({super.key});

  @override
  ConsumerState<Populer5> createState() => _YourAkisState();
}

class _YourAkisState extends ConsumerState<Populer5> {
  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;
    final postPreferences = ref.read(postPreferencesProvider("Post0"));
    final postPreferences1 = ref.read(postPreferencesProvider("Post1"));
    final postPreferences2 = ref.read(postPreferencesProvider("Post2"));
    final postPreferences3 = ref.read(postPreferencesProvider("Post3"));
    final postPreferences4 = ref.read(postPreferencesProvider("Post4"));

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Container(
              height: p_height * 0.48,
              width: p_width * 0.95,
              color: const Color(0xFF4AE8FF),
              child: Stack(
                children: [
                  SizedBox(
                    //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                    height: p_height * 0.08,
                    width: p_width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:  postPreferences.value!.userImage != "" ? NetworkImage(postPreferences.value!.userImage) : null,
                          backgroundColor: postPreferences.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 30,
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          postPreferences.value!.userName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.082,
                    child: Container(
                      height: p_height * 0.3,
                      width: p_width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(postPreferences.value!.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.4,
                      child: SingleChildScrollView(
                        child: Row(
                          children: [
                            SizedBox(
                              height: p_height * 0.07,
                              width: p_width *0.95,
                              child: Text(
                                softWrap: true,
                                '${postPreferences.value!.userName}  :        ${postPreferences.value!.info}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: p_height * 0.48,
              width: p_width * 0.95,
              color: const Color(0xFF4AE8FF),
              child: Stack(
                children: [
                  SizedBox(
                    //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                    height: p_height * 0.08,
                    width: p_width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:  postPreferences1.value!.userImage != "" ? NetworkImage(postPreferences1.value!.userImage) : null,
                          backgroundColor: postPreferences1.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 30,
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          postPreferences1.value!.userName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.082,
                    child: Container(
                      height: p_height * 0.3,
                      width: p_width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(postPreferences1.value!.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.4,
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          SizedBox(
                            height: p_height * 0.06,
                            width: p_width *0.95,
                            child: Text(
                              softWrap: true,
                              '${postPreferences1.value!.userName}  :        ${postPreferences1.value!.info}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: p_height * 0.48,
              width: p_width * 0.95,
              color: const Color(0xFF4AE8FF),
              child: Stack(
                children: [
                  SizedBox(
                    //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                    height: p_height * 0.08,
                    width: p_width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:  postPreferences2.value!.userImage != "" ? NetworkImage(postPreferences2.value!.userImage) : null,
                          backgroundColor: postPreferences2.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 30,
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          postPreferences2.value!.userName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.082,
                    child: Container(
                      height: p_height * 0.3,
                      width: p_width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(postPreferences2.value!.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.4,
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          SizedBox(
                            height: p_height * 0.07,
                            width: p_width *0.95,
                            child: Text(
                              softWrap: true,
                              '${postPreferences2.value!.userName}  :        ${postPreferences2.value!.info}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: p_height * 0.48,
              width: p_width * 0.95,
              color: const Color(0xFF4AE8FF),
              child: Stack(
                children: [
                  SizedBox(
                    //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                    height: p_height * 0.08,
                    width: p_width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:  postPreferences3.value!.userImage != "" ? NetworkImage(postPreferences3.value!.userImage) : null,
                          backgroundColor: postPreferences3.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 30,
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          postPreferences3.value!.userName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.082,
                    child: Container(
                      height: p_height * 0.3,
                      width: p_width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(postPreferences3.value!.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.4,
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          SizedBox(
                            height: p_height * 0.07,
                            width: p_width *0.95,
                            child: Text(
                              softWrap: true,
                              '${postPreferences3.value!.userName}  :        ${postPreferences3.value!.info}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              height: p_height * 0.48,
              width: p_width * 0.95,
              color: const Color(0xFF4AE8FF),
              child: Stack(
                children: [
                  SizedBox(
                    //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                    height: p_height * 0.08,
                    width: p_width * 0.95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundImage:  postPreferences4.value!.userImage != "" ? NetworkImage(postPreferences4.value!.userImage) : null,
                          backgroundColor: postPreferences4.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 30,
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          postPreferences4.value!.userName,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.082,
                    child: Container(
                      height: p_height * 0.3,
                      width: p_width * 0.95,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(postPreferences4.value!.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.4,
                    child: SingleChildScrollView(
                      child: Row(
                        children: [
                          SizedBox(
                            height: p_height * 0.07,
                            width: p_width *0.95,
                            child: Text(
                              softWrap: true,
                              '${postPreferences4.value!.userName}  :        ${postPreferences4.value!.info}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}