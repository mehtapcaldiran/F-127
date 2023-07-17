import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class BadgesPreferences {
  final String badgeName;
  final String badgeInfo;
  final String badgeImage;

  BadgesPreferences({
    required this.badgeName,
    required this.badgeInfo,
    required this.badgeImage,
  });
}

final badgesPreferencesProvider = FutureProvider.family<BadgesPreferences, String>((ref, value) async {
  final String userId = value;
  final DocumentSnapshot user = await FirebaseFirestore.instance.collection('badges').doc(userId).get();

  final String badgeName = user.get('badgeName');
  final String badgeInfo = user.get('badgeInfo');
  final String badgeImage = user.get('badgeImage');



  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('badgeName', badgeName);
  prefs.setString('badgeInfo', badgeInfo);
  prefs.setString('badgeImage', badgeImage);


  return BadgesPreferences(
      badgeName: badgeName,
      badgeInfo: badgeInfo,
      badgeImage: badgeImage,
  );
});