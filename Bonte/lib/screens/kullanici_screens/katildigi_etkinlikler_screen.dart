import 'package:bonte/utilis/etkinlik_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../model_providers/events_provider.dart';

void main() => runApp(KatildigiEtkinlikler());

class KatildigiEtkinlikler extends ConsumerStatefulWidget {
  const KatildigiEtkinlikler({super.key});

  @override
  ConsumerState<KatildigiEtkinlikler> createState() => _EtkinliklerState();
}

class _EtkinliklerState extends ConsumerState<KatildigiEtkinlikler> {
  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;
    final eventProvider = ref.read(eventsPreferencesProvider("49ToXNTJc8cLbF8HN2Hf"));
    final eventProvider1 = ref.read(eventsPreferencesProvider("SZeLRenxtyhfDWln86YV"));
    final eventProvider2 = ref.read(eventsPreferencesProvider("579pesDiGlLLcLWwL1Oi"));

    return ListView(
      children: [
        SizedBox(height: 10,),
        Container(
          height: p_height * 0.12,
          width: p_width * 0.7,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF1B5966),),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: (){
                context.push('/etkinlikInfo');
              },
              leading: Image.network(eventProvider.value!.eventImage),
              title: Text('${eventProvider.value!.eventName}',),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${eventProvider.value!.eventInfo}'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: p_height * 0.12,
          width: p_width * 0.7,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF1B5966),),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: (){
                context.push('/etkinlikInfo');
              },
              leading: Image.network(eventProvider1.value!.eventImage),
              title: Text('${eventProvider1.value!.eventName}',),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${eventProvider1.value!.eventInfo}'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: p_height * 0.12,
          width: p_width * 0.7,
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: Color(0xFF1B5966),),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              onTap: (){
                context.push('/etkinlikInfo');
              },
              leading: Image.network(eventProvider2.value!.eventImage),
              title: Text('${eventProvider2.value!.eventName}',),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${eventProvider2.value!.eventInfo}'),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 15,),
      ],
    );
  }
}
