import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/deneme_model.dart';

final denemeProvider = FutureProvider<List<dynamic>>((ref) async {
  CollectionReference deneme = FirebaseFirestore.instance.collection('deneme');

  final response = await deneme.get();

  if (response.docs.isNotEmpty) {
    return response.docs.map((doc) {
      return DenemeModel().fromFirebase(doc as DocumentSnapshot<Map<String, dynamic>>);
    }).toList();
  }

  return [];
});