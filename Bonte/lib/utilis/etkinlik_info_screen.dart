import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../model_providers/badges_provider.dart';
import '../model_providers/events_provider.dart';
import '../model_providers/user_kullanici_provider.dart';
import 'badge_show.dart';

void main() => runApp(EtkinlikInfo());

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


    final userPreferences = ref.read(userPreferencesProvider);
    final eventProvider = ref.read(eventsPreferencesProvider("SZeLRenxtyhfDWln86YV"));
    final badgesProvider = ref.read(badgesPreferencesProvider("UgXlQ95n6gfjPHMAiR2x"));

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFD9F0F5),
        leading: Container(
          padding: EdgeInsets.only(left:5, top: 5),
          child: IconButton(
            onPressed: (){
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
            '${eventProvider.value!.eventName}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: p_height * 0.4,
                width: p_width * 0.85,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(eventProvider.value!.eventImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: p_height * 0.18,
                width: p_width * 0.85,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFD6D4D4),
                ),
                child: Center(child: Text(
                  '${eventProvider.value!.eventInfo}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: p_height * 0.18,
                width: p_width * 0.85,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFD6D4D4),
                ),
                child: Center(child: Column(
                  children: [
                    Text(
                    'Kazanımlar',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                    SizedBox(height: 15,),
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
                          child: Icon(
                            Icons.badge,
                            size: 45,
                          ),
                        ),
                      ],
                    ),
                    Row(
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
              SizedBox(height: 15,),
              Container(
                height: p_height * 0.06,
                width: p_width * 0.85,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: eventProvider.value!.status != "1" ? MaterialStateProperty.all(Colors.grey,) : MaterialStateProperty.all(Color(0xFF1B5966),),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                  ),
                  onPressed: () {

                  },
                  child: Text(
                    'Kayıt Ol',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
