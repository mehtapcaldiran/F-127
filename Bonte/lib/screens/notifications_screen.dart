import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const Notifications());

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Gösterilecek bildirim yok.'),
      ),
    );
  }
}
