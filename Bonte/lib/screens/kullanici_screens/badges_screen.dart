import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../model_providers/badges_provider.dart';
import '../../model_providers/user_kullanici_provider.dart';
import '../../utilis/badge_show.dart';

void main() => runApp(const Badges());

class Badges extends ConsumerStatefulWidget {
  const Badges({super.key});

  @override
  ConsumerState<Badges> createState() => _BadgesTwoState();
}

class _BadgesTwoState extends ConsumerState<Badges> {

  void badgeShow(BuildContext context, String badgeId) {
    showDialog(
      context: context,
      builder: (_) => badgeShowDialog(badgeId: badgeId),
    );
  }


  @override
  Widget build(BuildContext context) {

    final userPreferences = ref.read(userPreferencesProvider);

    final badgesProvider0 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[0]));
    final badgesProvider1 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[1]));
    final badgesProvider2 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[2]));
    final badgesProvider3 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[3]));
    final badgesProvider4 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[4]));
    final badgesProvider5 = ref.read(badgesPreferencesProvider("badge1"));
    final badgesProvider6 = ref.read(badgesPreferencesProvider("badge2"));
    final badgesProvider7 = ref.read(badgesPreferencesProvider("badge3"));
    final badgesProvider8 = ref.read(badgesPreferencesProvider("badge4"));
    final badgesProvider9 = ref.read(badgesPreferencesProvider("badge5"));
    final badgesProvider01 = ref.read(badgesPreferencesProvider("badge6"));
    final badgesProvider02 = ref.read(badgesPreferencesProvider("badge7"));





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
                    child: Text('Rozetler',
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
                              userPreferences.value!.badges[0],
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider0.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              userPreferences.value!.badges[1],
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
                              userPreferences.value!.badges[2],
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
                              userPreferences.value!.badges[3],
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
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              userPreferences.value!.badges[4],
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
                              "badges1",
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
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "badges2",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider6.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "badges3",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider7.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "badges4",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider8.value!.badgeImage),
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
                              "badges5",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider9.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "badges6",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider01.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            badgeShow(
                              context,
                              "badges7",
                            );
                          },
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider02.value!.badgeImage),
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
