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

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
          actions: [
            userAvatar.isEmpty
                ? IconButton(
                    icon: const Icon(Icons.account_circle),
                    onPressed: () => (
                      Navigator.pushNamed(
                        context,
                        '/userdetailspage',
                      ),
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: NetworkImage(userAvatar),
                    backgroundColor: const Color.fromRGBO(204, 255, 204, 1),
                  ),
          ],
        ),
        // zaseban AppColor file sa bojama, app typography i app_theme refactorat
        backgroundColor: const Color.fromRGBO(42, 45, 53, 1),
        body: _screens[selectedIndex],
        bottomNavigationBar: NavigationBar(
          height: 60,
          destinations: [
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: ref.watch(bottomNavigationIndexProvider) == 0
                        ? Colors.green
                        : Colors.grey,
                  ),
                  label: ''),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag,
                  color: ref.watch(bottomNavigationIndexProvider) == 1
                      ? Colors.green
                      : Colors.grey,
                ),
                label: '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: NavigationDestination(
                icon: Icon(
                  Icons.list_alt,
                  color: ref.watch(bottomNavigationIndexProvider) == 2
                      ? Colors.green
                      : Colors.grey,
                ),
                label: '',
              ),
            ),
          ],
          indicatorColor: const Color.fromRGBO(110, 119, 100, 0.8),
          backgroundColor: const Color.fromRGBO(90, 94, 86, 0.5),
          animationDuration: const Duration(seconds: 1),
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) =>
              ref.read(bottomNavigationIndexProvider.notifier).state = index,
        ),
      ),
    );
  }
}
