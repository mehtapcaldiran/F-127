import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model_providers/badges_provider.dart';

class badgeShowDialog extends ConsumerWidget {
  final String badgeId;

  badgeShowDialog({required this.badgeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p_height = MediaQuery.of(context).size.height;
    final p_width = MediaQuery.of(context).size.width;
    final badgesProvider = ref.watch(badgesPreferencesProvider(badgeId));

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Container(
        width: 500,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(badgesProvider.value!.badgeImage),
            fit: BoxFit.cover,
          ),
        ),
      ),
      content: Container(
        height: p_height * 0.2,
        width: p_width * 0.4,
        child: Center(
          child: Column(
            children: [
              Text(
                badgesProvider.value!.badgeName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15,),
              Text(
                badgesProvider.value!.badgeInfo,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ),
      ],
    );
  }
}
