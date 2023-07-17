import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:bonte/models/base_model.dart';

import '../expection/firebase_expection.dart';

class DenemeModel extends Equatable with IdModel, BaseModel<DenemeModel>{
  String? name;
  final String? surname;
  final int? yas;
  @override
  final String? id;

  DenemeModel({
  this.name,
  this.surname,
  this.yas,
  this.id,
  });

  @override
  List<Object?> get props => [name, surname, yas, id];

  DenemeModel copyWith({
  String? name,
  String? surname,
  int? yas,
  String? id,
  }) {
  return DenemeModel(
  name: name ?? this.name,
  surname: surname ?? this.surname,
  yas: yas ?? this.yas,
  id: id ?? this.id,
  );
  }

  Map<String, dynamic> toJson() {
  return {
  'name': name,
  'surname': surname,
  'yas': yas,
  'id': id,
  };
  }

  @override
  DenemeModel fromJson(Map<String, dynamic> json) {
    return DenemeModel(
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      yas: json['yas'] as int?,
      id: json['id'] as String?,
    );
  }

  @override
  DenemeModel fromFirebase(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final value = snapshot.data();
    if (value == null) {
      throw FirebaseCustomException('$snapshot data is null');
    }
    value.addEntries([MapEntry('id', snapshot.id)]);
    return fromJson(value);
  }

  }

