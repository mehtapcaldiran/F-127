import 'package:bonte/utilis/badge_show.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../model_providers/badges_provider.dart';
import '../../model_providers/events_provider.dart';
import '../../model_providers/user_kullanici_provider.dart';

void main() => runApp(const YourKullaniciProfile());

class YourKullaniciProfile extends ConsumerStatefulWidget {
  const YourKullaniciProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<YourKullaniciProfile> createState() => _YourKullaniciProfileState();
}

class _YourKullaniciProfileState extends ConsumerState<YourKullaniciProfile> {

  void badgeShow(BuildContext context, String badgeId) {
    showDialog(
      context: context,
      builder: (_) => badgeShowDialog(badgeId: badgeId),
    );
  }


  @override
  Widget build(BuildContext context) {

    final userPreferences = ref.read(userPreferencesProvider);
    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;


    final mainBadgeProvider0 = ref.read(badgesPreferencesProvider(userPreferences.value!.mainBadges[0]));
    final mainBadgeProvider1 = ref.read(badgesPreferencesProvider(userPreferences.value!.mainBadges[1]));
    final badgesProvider0 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[0]));
    final badgesProvider1 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[1]));
    final badgesProvider2 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[2]));
    final badgesProvider3 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[3]));
    final badgesProvider4 = ref.read(badgesPreferencesProvider(userPreferences.value!.badgesShowcase[4]));
    //final eventProvider = ref.read(eventsPreferencesProvider(userPreferences.value!.eventsAttended[0]));
    //final eventProvider1 = ref.read(eventsPreferencesProvider(userPreferences.value!.eventsAttended[1]));
    //final eventProvider2 = ref.read(eventsPreferencesProvider(userPreferences.value!.eventsAttended[2]));
    final eventProvider = ref.read(eventsPreferencesProvider("49ToXNTJc8cLbF8HN2Hf"));
    final eventProvider1 = ref.read(eventsPreferencesProvider("SZeLRenxtyhfDWln86YV"));
    final eventProvider2 = ref.read(eventsPreferencesProvider("579pesDiGlLLcLWwL1Oi"));

    return Scaffold(
      backgroundColor: const Color(0xFFD9F0F5),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (){
                context.go('/kullaniciSettings');
              },
              icon: const Icon(
                  Icons.settings,
                color: Colors.grey,
                size: 35,
              ),
          ),
        ],
        elevation: 0,
        backgroundColor: const Color(0xFFD9F0F5),
        leading: Container(
          padding: const EdgeInsets.only(left:5, top: 5),
          child: IconButton(
            onPressed: (){
              context.go('/');
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xff1b5966b),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10,),
                height: pHeight * 0.35,
                width: pWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFD6D4D4),
                ),
                child: Column(
                  children: [
                      CircleAvatar(
                        backgroundImage:  userPreferences.value!.image != "" ? NetworkImage(userPreferences.value!.image) : null,
                        backgroundColor: userPreferences.value!.image != "" ? Colors.transparent : Colors.grey,
                          radius: 70,
                        ),
                    const SizedBox(height: 10,),
                    Text(
                      '${userPreferences.value?.name} ${userPreferences.value?.surname}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '${userPreferences.value?.loc}',
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 10,),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 InkWell(
                                   onTap: () {
                                     badgeShow(
                                       context,
                                       userPreferences.value!.mainBadges[0],
                                     );
                                     },
                                   child: Container(
                                     width: 50,
                                     height: 50,
                                     decoration: BoxDecoration(
                                       image: DecorationImage(
                                         image: NetworkImage(mainBadgeProvider0.value!.badgeImage),
                                         fit: BoxFit.cover,
                                       ),
                                     ),
                                   ),
                                 ),
                                 const SizedBox(width: 20,),
                                 InkWell(
                                   onTap: () {
                                     badgeShow(
                                       context,
                                       userPreferences.value!.mainBadges[1],
                                     );
                                   },
                                   child: Container(
                                     width: 50,
                                     height: 50,
                                     decoration: BoxDecoration(
                                       image: DecorationImage(
                                         image: NetworkImage(mainBadgeProvider1.value!.badgeImage),
                                         fit: BoxFit.cover,
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: pHeight * 0.18,
                width: pWidth * 0.9,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD6D4D4),
                ),
                child: Center(child: Text(
                  '${userPreferences.value?.info}',
                    style: const TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: pHeight * 0.11,
                width: pWidth * 0.9,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD6D4D4),
                ),
                child: Stack(
                  children: [
                    const Text(
                      'Rozet Vitrini',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Positioned(
                      top: pHeight * 0.025,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                userPreferences.value!.badgesShowcase[0],
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(badgesProvider0.value!.badgeImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                userPreferences.value!.badgesShowcase[1],
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(badgesProvider1.value!.badgeImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                userPreferences.value!.badgesShowcase[2],
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(badgesProvider2.value!.badgeImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                userPreferences.value!.badgesShowcase[3],
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(badgesProvider3.value!.badgeImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                userPreferences.value!.badgesShowcase[4],
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(badgesProvider4.value!.badgeImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          IconButton(
                            onPressed: (){
                              context.push('/badges');
                              },
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: pHeight * 0.11,
                width: pWidth * 0.9,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD6D4D4),
                ),
                child: Stack(
                  children: [
                    const Text(
                      'Peç Vitrini',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Positioned(
                      top: pHeight * 0.025,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                "pec1",
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://img.icons8.com/?size=512&id=w8pFmJ5x2OZV&format=png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                "pec2",
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://img.icons8.com/?size=512&id=HFfgVaJNpYdO&format=png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                "pec3",
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://img.icons8.com/?size=512&id=WomxPe5K20Ry&format=png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                "pec4",
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://img.icons8.com/?size=512&id=VaG7UrLy8YNk&format=png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: () {
                              badgeShow(
                                context,
                                "pec5",
                              );
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage("https://img.icons8.com/?size=512&id=W0YLRoq5ZGgR&format=png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          IconButton(
                            onPressed: (){
                              context.push('/badgesTwo');
                            },
                            icon: const Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: pHeight * 0.25,
                width: pWidth * 0.9,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD6D4D4),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: pWidth * 0.39,),
                      child: const Text(
                        'Katıldığı Etkinlikler',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: (){
                                context.push('/etkinlikInfo');
                              },
                              child: Card(
                                color: const Color(0xFFD6D4D4),
                                child: SizedBox(
                                  height: pHeight * 0.17,
                                  width: pWidth * 0.2,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: pHeight *0.08,
                                        width: pWidth * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(eventProvider.value!.eventImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Text(
                                        eventProvider.value!.eventName,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                context.push('/etkinlikInfo');
                              },
                              child: Card(
                                color: const Color(0xFFD6D4D4),
                                child: SizedBox(
                                  height: pHeight * 0.17,
                                  width: pWidth * 0.2,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: pHeight *0.08,
                                        width: pWidth * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(eventProvider1.value!.eventImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Text(eventProvider1.value!.eventName,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //badgeName
                            //badgeInfo
                            //badgeImage
                            InkWell(
                              onTap: (){
                                context.push('/etkinlikInfo');
                              },
                              child: Card(
                                color: const Color(0xFFD6D4D4),
                                child: SizedBox(
                                  height: pHeight * 0.17,
                                  width: pWidth * 0.2,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: pHeight *0.08,
                                        width: pWidth * 0.2,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: NetworkImage(eventProvider2.value!.eventImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Text(eventProvider2.value!.eventName,),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                context.push('/katildigiEtkinlikler');
                              },
                              icon: const Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                  ],
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(top:15),
                  child: Container(
                    height: pHeight * 0.1,
                    width: pWidth * 0.9,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFD6D4D4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Aktiviteler',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),
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

