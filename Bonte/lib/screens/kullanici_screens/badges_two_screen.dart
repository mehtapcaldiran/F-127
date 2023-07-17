import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../model_providers/badges_provider.dart';
import '../../utilis/badge_show.dart';

void main() => runApp(const BadgesTwo());

class BadgesTwo extends ConsumerStatefulWidget {
  const BadgesTwo({super.key});

  @override
  ConsumerState<BadgesTwo> createState() => _BadgesTwoEditState();
}

class _BadgesTwoEditState extends ConsumerState<BadgesTwo> {



  void badgeShow(BuildContext context, String badgeId) {
    showDialog(
      context: context,
      builder: (_) => badgeShowDialog(badgeId: badgeId),
    );
  }


  @override
  Widget build(BuildContext context) {



    final badgesProvider1 = ref.read(badgesPreferencesProvider("pac1"));
    final badgesProvider2 = ref.read(badgesPreferencesProvider("pac2"));
    final badgesProvider3 = ref.read(badgesPreferencesProvider("pac3"));
    final badgesProvider4 = ref.read(badgesPreferencesProvider("pac4"));
    final badgesProvider5 = ref.read(badgesPreferencesProvider("pac5"));



    return Scaffold(
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
              color: Color(0xff1b5966b),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: [
                  const SizedBox(height: 30,),
                  const Center(
                    child: Text('Peçler',
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
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "pec1",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider1.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "pec2",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider2.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "pec3",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider3.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
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
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "pec4",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider4.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "pec5",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider5.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
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

