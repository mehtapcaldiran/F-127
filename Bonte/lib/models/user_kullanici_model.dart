import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserKullaniciModel {
  final String id;
  String name;
  String surname;
  int yas;

  UserKullaniciModel({
    required this.id,
    required this.name,
    required this.surname,
    required this.yas,
  });

  UserKullaniciModel copyWith({
    String? id,
    String? name,
    String? surname,
    int? yas,
  }) {
    return UserKullaniciModel(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      yas: yas ?? this.yas,
    );
  }
}

class UserNotifier extends StateNotifier<UserKullaniciModel> {
  UserNotifier(UserKullaniciModel userModel, {required String id}) : super(userModel);

  void updateName(String newName) {
    state = state.copyWith(name: newName);
  }

  void updateSurname(String newSurname) {
    state = state.copyWith(surname: newSurname);
  }

  void updateAge(int newyas) {
    state = state.copyWith(yas: newyas);
  }
}

final userProvider = StateNotifierProvider<UserNotifier, UserKullaniciModel>((ref) {
  return UserNotifier(UserKullaniciModel(name: '', surname: '', yas: 0, id: ''), id: '');
});

