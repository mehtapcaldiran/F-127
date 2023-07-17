import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../model_providers/badges_provider.dart';
import '../model_providers/events_provider.dart';
import 'badge_show.dart';

void main() => runApp(const EtkinlikInfo());

class EtkinlikInfo extends ConsumerStatefulWidget {
  const EtkinlikInfo({super.key});

  @override
  ConsumerState<EtkinlikInfo> createState() => _EtkinlikInfoState();
}

class _EtkinlikInfoState extends ConsumerState<EtkinlikInfo> {
  @override
  Widget build(BuildContext context) {

    void badgeShow(BuildContext context, String badgeId) {
      showDialog(
        context: context,
        builder: (_) => badgeShowDialog(badgeId: badgeId),
      );
    }


    final eventProvider = ref.read(eventsPreferencesProvider("SZeLRenxtyhfDWln86YV"));
    final badgesProvider = ref.read(badgesPreferencesProvider("UgXlQ95n6gfjPHMAiR2x"));

    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
            eventProvider.value!.eventName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                height: pHeight * 0.4,
                width: pWidth * 0.85,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(eventProvider.value!.eventImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: pHeight * 0.18,
                width: pWidth * 0.85,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD6D4D4),
                ),
                child: Center(child: Text(
                  eventProvider.value!.eventInfo,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: pHeight * 0.18,
                width: pWidth * 0.85,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFFD6D4D4),
                ),
                child: Center(child: Column(
                  children: [
                    const Text(
                    'Kazanımlar',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (){
                            badgeShow(
                              context,
                              "UgXlQ95n6gfjPHMAiR2x",
                            );
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(badgesProvider.value!.badgeImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            badgeShow(
                              context,
                              eventProvider.value!.badge,
                            );
                          },
                          child: const Icon(
                            Icons.badge,
                            size: 45,
                          ),
                        ),
                      ],
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Rozet',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Sertifika',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height: pHeight * 0.06,
                width: pWidth * 0.85,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: eventProvider.value!.status != "1" ? MaterialStateProperty.all(Colors.grey,) : MaterialStateProperty.all(const Color(0xFF1B5966),),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  onPressed: () {

                  },
                  child: const Text(
                    'Kayıt Ol',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
