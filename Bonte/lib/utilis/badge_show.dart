import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model_providers/badges_provider.dart';

class badgeShowDialog extends ConsumerWidget {
  final String badgeId;

  const badgeShowDialog({super.key, required this.badgeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pHeight = MediaQuery.of(context).size.height;
    final pWidth = MediaQuery.of(context).size.width;
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
      content: SizedBox(
        height: pHeight * 0.2,
        width: pWidth * 0.4,
        child: Center(
          child: Column(
            children: [
              Text(
                badgesProvider.value!.badgeName,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15,),
              Text(
                badgesProvider.value!.badgeInfo,
                style: const TextStyle(
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
            child: const Text('Close'),
          ),
        ),
      ],
    );
  }
}
