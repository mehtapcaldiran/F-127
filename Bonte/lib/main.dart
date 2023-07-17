import 'package:bonte/route/go_router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: BonteApp()));
}

class BonteApp extends ConsumerStatefulWidget {
  const BonteApp({super.key});

  @override
  ConsumerState<BonteApp> createState() => _BonteAppState();
}

class _BonteAppState extends ConsumerState<BonteApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,

      title: 'Bonte App',
      debugShowCheckedModeBanner: false,
    );
  }
}

