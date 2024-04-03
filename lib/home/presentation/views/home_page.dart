import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

final bottomNavigationIndexProvider = StateProvider<int>((ref) => 0);
final userAvatarProvider = StateProvider<String>((ref) => '');

@RoutePage()
class HomePage extends HookConsumerWidget {
  HomePage({super.key, required String text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(bottomNavigationIndexProvider);
    // var onItemSelected = ref.read(bottomNavigationIndexProvider.notifier).state;
    var userAvatar = ref.watch(userAvatarProvider);

    final _screens = [
      const Center(child: Text('Home')),
      const Center(child: Text('Products')),
      const Center(child: Text('Log')),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          userAvatar.isEmpty
              ? IconButton(
                  icon: const Icon(
                      Icons.account_circle), // Placeholder for no avatar
                  onPressed: () => {}, // Handle no avatar case (optional)
                )
              : CircleAvatar(
                  backgroundImage:
                      NetworkImage(userAvatar), // Load image from URL
                ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
      body: _screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromRGBO(121, 127, 117, 0.6),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.shopping_bag), label: 'Products'),
          NavigationDestination(icon: Icon(Icons.list_alt), label: 'Log'),
        ],
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) =>
            ref.read(bottomNavigationIndexProvider.notifier).state = index,
      ),
    );
  }
}
