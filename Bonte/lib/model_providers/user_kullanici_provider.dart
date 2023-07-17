import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class UserPreferences {
  final String name;
  final String surname;
  final int type;
  final List<dynamic> eventsAttended;
  final List<dynamic> member;
  final List<dynamic> mainBadges;
  final String loc;
  final String info;
  final String image;
  final List<dynamic> follow;
  final List<dynamic> badgesShowcase;
  final List<dynamic> badges2Showcase;
  final List<dynamic> badges;
  final List<dynamic> badges2;
  //final String backgroundColor;

  UserPreferences({
    required this.name,
    required this.surname,
    required this.type,
    required this.eventsAttended,
    required this.member,
    required this.mainBadges,
    required this.loc,
    required this.info,
    required this.image,
    required this.follow,
    required this.badgesShowcase,
    required this.badges2Showcase,
    required this.badges,
    required this.badges2,
    //required this.backgroundColor,
  });
}

final userPreferencesProvider = FutureProvider<UserPreferences>((ref) async {
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  final DocumentSnapshot user = await FirebaseFirestore.instance.collection('user').doc(userId).get();

  final String name = user.get('name');
  final String surname = user.get('surname');
  final int type = user.get('type');
  final List<dynamic> eventsAttendedDynamic = user.get('eventsAttended');
  final List<String> eventsAttended = eventsAttendedDynamic.cast<String>();
  final List<dynamic> memberDynamic = user.get('member');
  final List<String> member = memberDynamic.cast<String>();
  final List<dynamic> mainBadgesDynamic = user.get('mainBadges');
  final List<String> mainBadges = mainBadgesDynamic.cast<String>();
  final String loc = user.get('loc');
  final String info = user.get('info');
  final String image = user.get('image');
  final List<dynamic> followDynamic = user.get('follow');
  final List<String> follow = followDynamic.cast<String>();
  final List<dynamic> badgesShowcaseDynamic = user.get('badgesShowcase');
  final List<String> badgesShowcase = badgesShowcaseDynamic.cast<String>();
  final List<dynamic> badges2ShowcaseDynamic = user.get('badges2Showcase');
  final List<String> badges2Showcase = badges2ShowcaseDynamic.cast<String>();
  final List<dynamic> badgesDynamic = user.get('badges');
  final List<String> badges = badgesDynamic.cast<String>();
  final List<dynamic> badges2Dynamic = user.get('badges2');
  final List<String> badges2 = badges2Dynamic.cast<String>();
  //final String backgroundColor = user.get('backgroundColor');



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
  //prefs.setString('backgroundColor', backgroundColor);

  return UserPreferences(
    name: name,
    surname: surname,
    type: type,
    eventsAttended: eventsAttended,
    member: member,
    mainBadges: mainBadges,
    loc: loc,
    info: info,
    image: image,
    follow: follow,
    badgesShowcase: badgesShowcase,
    badges2Showcase: badges2Showcase,
    badges: badges,
    badges2: badges2,
    //backgroundColor: backgroundColor,


  );
});




