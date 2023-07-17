import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class KurumPreferences {
  final String name;
  final int type;
  final List<dynamic> yourEvents;
  final List<dynamic> member;
  final String loc;
  final String info;
  final String image;
  final List<dynamic> follow;
  final List<dynamic> badges;
  final List<dynamic> badges2;
  final String backgroundImage;

  KurumPreferences({
    required this.name,
    required this.type,
    required this.yourEvents,
    required this.member,
    required this.loc,
    required this.info,
    required this.image,
    required this.follow,
    required this.badges,
    required this.badges2,
    required this.backgroundImage,
  });
}

final kurumPreferencesProvider = FutureProvider<KurumPreferences>((ref) async {
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  final DocumentSnapshot user = await FirebaseFirestore.instance.collection('user').doc(userId).get();

  final String name = user.get('name');
  final int type = user.get('type');
  final List<dynamic> yourEventsDynamic = user.get('yourEvents');
  final List<String> yourEvents = yourEventsDynamic.cast<String>();
  final List<dynamic> memberDynamic = user.get('member');
  final List<String> member = memberDynamic.cast<String>();
  final String loc = user.get('loc');
  final String info = user.get('info');
  final String image = user.get('image');
  final List<dynamic> followDynamic = user.get('follow');
  final List<String> follow = followDynamic.cast<String>();
  final List<dynamic> badgesDynamic = user.get('badges');
  final List<String> badges = badgesDynamic.cast<String>();
  final List<dynamic> badges2Dynamic = user.get('badges2');
  final List<String> badges2 = badges2Dynamic.cast<String>();
  final String backgroundImage = user.get('backgroundImage');



  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  prefs.setInt('type', type);
  prefs.setStringList('yourEvents', yourEvents);
  prefs.setStringList('member', member);
  prefs.setString('loc', loc);
  prefs.setString('info', info);
  prefs.setString('image', image);
  prefs.setStringList('follow', follow);
  prefs.setStringList('badges', badges);
  prefs.setStringList('badges2', badges2);
  prefs.setString('backgroundImage', backgroundImage);

  return KurumPreferences(
    name: name,
    type: type,
    yourEvents: yourEvents,
    member: member,
    loc: loc,
    info: info,
    image: image,
    follow: follow,
    badges: badges,
    badges2: badges2,
    backgroundImage: backgroundImage,


  );
});