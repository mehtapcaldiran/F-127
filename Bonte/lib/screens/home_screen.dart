import 'package:bonte/model_providers/post_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Home());
class Home extends ConsumerStatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {

  @override
  Widget build(BuildContext context) {

    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;
    final postProvider = ref.read(postPreferencesProvider("Post5"));
    final postProvider1 = ref.read(postPreferencesProvider("Post4"));
    final postProvider2 = ref.read(postPreferencesProvider("Post6"));
    final postProvider3 = ref.read(postPreferencesProvider("Post0"));
    final postProvider4 = ref.read(postPreferencesProvider("Post2"));
    final postProvider5 = ref.read(postPreferencesProvider("Post3"));
    final postProvider6 = ref.read(postPreferencesProvider("Post1"));

    return Scaffold(
      backgroundColor: const Color(0xFFD9F0F5),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFD9F0F5),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(
                  Icons.messenger_outlined,
                color: Color(0xFF1B5966),
                size: 35,
              ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: pHeight * 0.53,
                  width: pWidth * 0.95,
                  color: const Color(0xFF4AE8FF),
                  child: Stack(
                    children: [
                      SizedBox(
                        //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                        height: pHeight * 0.08,
                        width: pWidth * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:  postProvider.value!.userImage != "" ? NetworkImage(postProvider.value!.userImage) : null,
                              backgroundColor: postProvider.value!.image != "" ? Colors.transparent : Colors.grey,
                              radius: 30,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              postProvider.value!.userName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.082,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postProvider.value!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: pHeight * 0.3,
                          width: pWidth * 0.95,
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.4,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              SizedBox(
                                height: pHeight * 0.07,
                                width: pWidth *0.95,
                                child: Text(
                                  softWrap: true,
                                  '${postProvider.value!.userName}  :        ${postProvider.value!.info}',
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
                      Positioned(
                        top: pHeight * 0.47,
                        child: SizedBox(
                          height: pHeight * 0.07,
                          width: pWidth * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  onPressed: (){},
                                  label: Text('Beğen  ' '${postProvider.value!.like}'),
                                  icon: const Icon(Icons.add_box),
                                ),
                              ),
                              //SizedBox(width: 10,),
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  onPressed: (){},
                                  label: const Text('Yorumlar'),
                                  icon: const Icon(Icons.comment),
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
                  height: pHeight * 0.53,
                  width: pWidth * 0.95,
                  color: const Color(0xFF4AE8FF),
                  child: Stack(
                    children: [
                      SizedBox(
                        //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                        height: pHeight * 0.08,
                        width: pWidth * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:  postProvider1.value!.userImage != "" ? NetworkImage(postProvider1.value!.userImage) : null,
                              backgroundColor: postProvider1.value!.image != "" ? Colors.transparent : Colors.grey,
                              radius: 30,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              postProvider1.value!.userName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.082,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postProvider1.value!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: pHeight * 0.3,
                          width: pWidth * 0.95,
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.4,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              SizedBox(
                                height: pHeight * 0.07,
                                width: pWidth *0.95,
                                child: Text(
                                  softWrap: true,
                                  '${postProvider1.value!.userName}  :        ${postProvider1.value!.info}',
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
                      Positioned(
                        top: pHeight * 0.47,
                        child: SizedBox(
                          height: pHeight * 0.07,
                          width: pWidth * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  label: Text('Beğen  ' '${postProvider1.value!.like}'),
                                  icon: const Icon(Icons.add_box),
                                ),
                              ),
                              //SizedBox(width: 10,),
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  onPressed: (){},
                                  label: const Text('Yorumlar'),
                                  icon: const Icon(Icons.comment),
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
                  height: pHeight * 0.53,
                  width: pWidth * 0.95,
                  color: const Color(0xFF4AE8FF),
                  child: Stack(
                    children: [
                      SizedBox(
                        //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                        height: pHeight * 0.08,
                        width: pWidth * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:  postProvider2.value!.userImage != "" ? NetworkImage(postProvider2.value!.userImage) : null,
                              backgroundColor: postProvider2.value!.image != "" ? Colors.transparent : Colors.grey,
                              radius: 30,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              postProvider2.value!.userName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.082,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postProvider2.value!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: pHeight * 0.3,
                          width: pWidth * 0.95,
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.4,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              SizedBox(
                                height: pHeight * 0.07,
                                width: pWidth *0.95,
                                child: Text(
                                  softWrap: true,
                                  '${postProvider2.value!.userName}  :        ${postProvider2.value!.info}',
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
                      Positioned(
                        top: pHeight * 0.47,
                        child: SizedBox(
                          height: pHeight * 0.07,
                          width: pWidth * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  label: Text('Beğen  ' '${postProvider2.value!.like}'),
                                  icon: const Icon(Icons.add_box),
                                ),
                              ),
                              //SizedBox(width: 10,),
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  onPressed: (){},
                                  label: const Text('Yorumlar'),
                                  icon: const Icon(Icons.comment),
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
                  height: pHeight * 0.53,
                  width: pWidth * 0.95,
                  color: const Color(0xFF4AE8FF),
                  child: Stack(
                    children: [
                      SizedBox(
                        //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                        height: pHeight * 0.08,
                        width: pWidth * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:  postProvider3.value!.userImage != "" ? NetworkImage(postProvider3.value!.userImage) : null,
                              backgroundColor: postProvider3.value!.image != "" ? Colors.transparent : Colors.grey,
                              radius: 30,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              postProvider3.value!.userName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.082,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postProvider3.value!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: pHeight * 0.3,
                          width: pWidth * 0.95,
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.4,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              SizedBox(
                                height: pHeight * 0.07,
                                width: pWidth *0.95,
                                child: Text(
                                  softWrap: true,
                                  '${postProvider3.value!.userName}  :        ${postProvider3.value!.info}',
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
                      Positioned(
                        top: pHeight * 0.47,
                        child: SizedBox(
                          height: pHeight * 0.07,
                          width: pWidth * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  label: Text('Beğen  ' '${postProvider3.value!.like}'),
                                  icon: const Icon(Icons.add_box),
                                ),
                              ),
                              //SizedBox(width: 10,),
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  onPressed: (){},
                                  label: const Text('Yorumlar'),
                                  icon: const Icon(Icons.comment),
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
                  height: pHeight * 0.53,
                  width: pWidth * 0.95,
                  color: const Color(0xFF4AE8FF),
                  child: Stack(
                    children: [
                      SizedBox(
                        //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                        height: pHeight * 0.08,
                        width: pWidth * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:  postProvider4.value!.userImage != "" ? NetworkImage(postProvider4.value!.userImage) : null,
                              backgroundColor: postProvider4.value!.image != "" ? Colors.transparent : Colors.grey,
                              radius: 30,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              postProvider4.value!.userName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.082,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postProvider4.value!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: pHeight * 0.3,
                          width: pWidth * 0.95,
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.4,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              SizedBox(
                                height: pHeight * 0.07,
                                width: pWidth *0.95,
                                child: Text(
                                  softWrap: true,
                                  '${postProvider4.value!.userName}  :        ${postProvider4.value!.info}',
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
                      Positioned(
                        top: pHeight * 0.47,
                        child: SizedBox(
                          height: pHeight * 0.07,
                          width: pWidth * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  label: Text('Beğen  ' '${postProvider4.value!.like}'),
                                  icon: const Icon(Icons.add_box),
                                ),
                              ),
                              //SizedBox(width: 10,),
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  onPressed: (){},
                                  label: const Text('Yorumlar'),
                                  icon: const Icon(Icons.comment),
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
                  height: pHeight * 0.53,
                  width: pWidth * 0.95,
                  color: const Color(0xFF4AE8FF),
                  child: Stack(
                    children: [
                      SizedBox(
                        //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                        height: pHeight * 0.08,
                        width: pWidth * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:  postProvider5.value!.userImage != "" ? NetworkImage(postProvider5.value!.userImage) : null,
                              backgroundColor: postProvider5.value!.image != "" ? Colors.transparent : Colors.grey,
                              radius: 30,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              postProvider5.value!.userName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.082,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postProvider5.value!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: pHeight * 0.3,
                          width: pWidth * 0.95,
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.4,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              SizedBox(
                                height: pHeight * 0.07,
                                width: pWidth *0.95,
                                child: Text(
                                  softWrap: true,
                                  '${postProvider5.value!.userName}  :        ${postProvider5.value!.info}',
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
                      Positioned(
                        top: pHeight * 0.47,
                        child: SizedBox(
                          height: pHeight * 0.07,
                          width: pWidth * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  label: Text('Beğen  ' '${postProvider5.value!.like}'),
                                  icon: const Icon(Icons.add_box),
                                ),
                              ),
                              //SizedBox(width: 10,),
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  onPressed: (){},
                                  label: const Text('Yorumlar'),
                                  icon: const Icon(Icons.comment),
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
                  height: pHeight * 0.53,
                  width: pWidth * 0.95,
                  color: const Color(0xFF4AE8FF),
                  child: Stack(
                    children: [
                      SizedBox(
                        //padding: EdgeInsets.only(bottom: p_height * 0.37, left: 10),
                        height: pHeight * 0.08,
                        width: pWidth * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundImage:  postProvider6.value!.userImage != "" ? NetworkImage(postProvider6.value!.userImage) : null,
                              backgroundColor: postProvider6.value!.image != "" ? Colors.transparent : Colors.grey,
                              radius: 30,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              postProvider6.value!.userName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.082,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(postProvider6.value!.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: pHeight * 0.3,
                          width: pWidth * 0.95,
                        ),
                      ),
                      Positioned(
                        top: pHeight * 0.4,
                        child: SingleChildScrollView(
                          child: Row(
                            children: [
                              SizedBox(
                                height: pHeight * 0.07,
                                width: pWidth *0.95,
                                child: Text(
                                  softWrap: true,
                                  '${postProvider6.value!.userName}  :        ${postProvider6.value!.info}',
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
                      Positioned(
                        top: pHeight * 0.47,
                        child: SizedBox(
                          height: pHeight * 0.07,
                          width: pWidth * 0.95,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  label: Text('Beğen  ' '${postProvider6.value!.like}'),
                                  icon: const Icon(Icons.add_box),
                                ),
                              ),
                              //SizedBox(width: 10,),
                              SizedBox(
                                height: pHeight * 0.05,
                                width: pWidth * 0.46,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF1B5966),),
                                  onPressed: (){},
                                  label: const Text('Yorumlar'),
                                  icon: const Icon(Icons.comment),
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
      ),
    );
  }
}
