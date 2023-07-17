import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(Notifications());

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Gösterilecek bildirim yok.'),
      ),
    );
  }
}
