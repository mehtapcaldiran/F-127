import 'package:flutter/material.dart';


class MyScreen extends StatefulWidget {
  final Widget child;
  const MyScreen({required this.child, Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: null,
    );
  }
}