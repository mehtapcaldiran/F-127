import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({Key? key, required this.child}) : super(key: key);

  final StatefulNavigationShell child;

  @override
  ConsumerState<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.child.currentIndex,
      onTap: (value) => _onTap(value),
      backgroundColor: Color(0xFFB3E1EB), // Arka plan rengi
      selectedItemColor: Color(0xFF1B5966), // Seçili öğenin rengi
      unselectedItemColor: Colors.grey, // Seçili olmayan öğelerin rengi
      //elevation: 8,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          activeIcon: Icon(Icons.home),
          label: 'Akış',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          activeIcon: Icon(Icons.search),
          label: 'Arama',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          activeIcon: Icon(Icons.notifications),
          label: 'Bildirimler',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          activeIcon: Icon(Icons.person),
          label: 'Profil',
        ),
      ],
    );

  }
  void _onTap(int index) {
      widget.child.goBranch(
      index,
    );
  }
}