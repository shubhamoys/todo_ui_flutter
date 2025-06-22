import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_ui_flutter/core/widgets/navigation_bar/app_bottom_navigation_bar.dart';

class BottomNavShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: navigationShell.goBranch,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // To be implemented later
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
