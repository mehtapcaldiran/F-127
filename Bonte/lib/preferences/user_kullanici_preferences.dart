import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> firebaseGetAll() async {
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  final DocumentSnapshot user = await FirebaseFirestore.instance.collection('user').doc(userId).get();

  final String name = user.get('name');
  final String surname = user.get('surname');
  final int type = user.get('type');
  final List<String> eventsAttended = user.get('eventsAttended');
  final List<String> member = user.get('member');
  final List<String> mainBadges = user.get('mainBadges');
  final String loc = user.get('loc');
  final String info = user.get('info');
  final String image = user.get('image');
  final List<String> follow = user.get('follow');
  final List<String> badgesShowcase = user.get('badgesShowcase');
  final List<String> badges2Showcase = user.get('badges2Showcase');
  final List<String> badges = user.get('badges');
  final List<String> badges2 = user.get('badges2');
  final String backgroundColor = user.get('backgroundColor');



  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  prefs.setString('surname', surname);
  prefs.setInt('type', type);
  prefs.setStringList('eventsAttended', eventsAttended);
  prefs.setStringList('member', member);
  prefs.setStringList('mainBadges', mainBadges);
  prefs.setString('loc', loc);
  prefs.setString('info', info);
  prefs.setString('image', image);
  prefs.setStringList('follow', follow);
  prefs.setStringList('badgesShowcase', badgesShowcase);
  prefs.setStringList('badges2Showcase', badges2Showcase);
  prefs.setStringList('badges', badges);
  prefs.setStringList('badges2', badges2);
  prefs.setString('backgroundColor', backgroundColor);
}