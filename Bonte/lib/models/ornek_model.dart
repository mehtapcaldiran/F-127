import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> firebaseToShared() async {
  final String userId = "K1IygW2hoUhBIw7yPa26";
  //final String userId = FirebaseAuth.instance.currentUser!.uid;
  final DocumentSnapshot ouaDoc = await FirebaseFirestore.instance.collection('deneme').doc(userId).get();

  final String name = ouaDoc.get('name');
  final String surname = ouaDoc.get('surname');
  final int yas = ouaDoc.get('yas');

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  prefs.setString('surname', surname);
  prefs.setInt('yas', yas);
}