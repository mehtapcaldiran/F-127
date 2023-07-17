import 'package:flutter/material.dart';

class RouteError extends StatefulWidget {
  final String errorMsg;
  const RouteError({required this.errorMsg, Key? key}) : super(key: key);

  @override
  State<RouteError> createState() => _RouteErrorState();
}

class _RouteErrorState extends State<RouteError> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 400 ,),
            Text(widget.errorMsg),
          ],
        ),
      ),
    );
  }
}
