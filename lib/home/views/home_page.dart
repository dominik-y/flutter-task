import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

final bottomNavigationIndexProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(bottomNavigationIndexProvider);
    var onItemSelected = ref.read(bottomNavigationIndexProvider.notifier).state;

    final List<Widget> _screens = [
      const Center(),
      const Center(),
      const Center(),
    ];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
      body: _screens[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Log',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) => onItemSelected = index,
      ),
    );
  }
}
