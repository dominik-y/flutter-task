import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rolla_task/features/log/presentation/views/logView.dart';
import 'package:rolla_task/features/products/presentation/views/products_page.dart';
import 'package:rolla_task/resources.dart';
import 'package:rolla_task/routing/app_router.gr.dart';

final bottomNavigationIndexProvider = StateProvider<int>((ref) => 0);
final userAvatarProvider = StateProvider<String>((ref) => '');

@RoutePage()
class HomePage extends HookConsumerWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(bottomNavigationIndexProvider);
    // var onItemSelected = ref.read(bottomNavigationIndexProvider.notifier).state;
    var userAvatar = ref.watch(userAvatarProvider);

    final _screens = [
      const Center(child: Text('Home')),
      const ProductsPage(),
      LogView(),
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: selectedIndex == 0
            ? AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColor.neutral1,
                title: const Text(
                  'Home',
                  style: TextStyle(color: AppColor.white),
                ),
                actions: [
                  userAvatar.isEmpty
                      ? IconButton(
                          icon: const Icon(Icons.account_circle),
                          color: AppColor.white,
                          onPressed: () {
                            context.router.push(UserDetailsPage());
                          },
                        )
                      : CircleAvatar(
                          backgroundImage: NetworkImage(userAvatar),
                          backgroundColor: AppColor.white,
                        ),
                ],
              )
            : AppBar(
                backgroundColor: AppColor.neutral1,
                title: const Text('Home'),
              ),
        backgroundColor: AppColor.neutral1,
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
                        ? AppColor.florescentGreen
                        : AppColor.neutral4,
                  ),
                  label: ''),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag,
                  color: ref.watch(bottomNavigationIndexProvider) == 1
                      ? AppColor.florescentGreen
                      : AppColor.neutral4,
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
                      ? AppColor.florescentGreen
                      : AppColor.neutral4,
                ),
                label: '',
              ),
            ),
          ],
          indicatorColor: AppColor.neutral3,
          backgroundColor: AppColor.neutral2,
          animationDuration: const Duration(seconds: 1),
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) =>
              ref.read(bottomNavigationIndexProvider.notifier).state = index,
        ),
      ),
    );
  }
}
