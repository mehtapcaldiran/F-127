import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PostPreferences {
  final int like;
  final String userName;
  final String info;
  final String image;
  final String userImage;

  PostPreferences({
    required this.like,
    required this.userName,
    required this.info,
    required this.image,
    required this.userImage,
  });
}

final postPreferencesProvider = FutureProvider.family<PostPreferences, String>((ref, value) async {
  final String postId = value;
  final DocumentSnapshot user = await FirebaseFirestore.instance.collection('posts').doc(postId).get();

  final int like = user.get('like');
  final String userName = user.get('userName');
  final String info = user.get('info');
  final String image = user.get('image');
  final String userImage = user.get('userImage');



  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('like', like);
  prefs.setString('userName', userName);
  prefs.setString('info', info);
  prefs.setString('image', image);
  prefs.setString('userImage', userImage);

  return PostPreferences(
    like: like,
    userName: userName,
    info: info,
    image: image,
    userImage: userImage,


  );
});