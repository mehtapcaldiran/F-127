import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class EventsPreferences {
  final String badge;
  final String eventInfo;
  final String eventImage;
  final String eventName;
  final String status;

  EventsPreferences({
    required this.badge,
    required this.eventInfo,
    required this.eventImage,
    required this.eventName,
    required this.status,
  });
}

final eventsPreferencesProvider = FutureProvider.family<EventsPreferences, String>((ref, value) async {
  final String userId = value;
  final DocumentSnapshot user = await FirebaseFirestore.instance.collection('events').doc(userId).get();

  final String badge = user.get('badge');
  final String eventInfo = user.get('eventInfo');
  final String eventImage = user.get('eventImage');
  final String eventName = user.get('eventName');
  final String status = user.get('status');


  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('badge', badge);
  prefs.setString('eventInfo', eventInfo);
  prefs.setString('eventImage', eventImage);
  prefs.setString('eventName', eventName);
  prefs.setString('status', status);

  return EventsPreferences(
    badge: badge,
    eventInfo: eventInfo,
    eventImage: eventImage,
    eventName: eventName,
    status: status,
  );
});