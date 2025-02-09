import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rolla_task/features/log/presentation/views/log_page.dart';
import 'package:rolla_task/features/products/presentation/views/products_page.dart';
import 'package:rolla_task/resources.dart';

final bottomNavigationIndexProvider = StateProvider<int>((ref) => 0);

@RoutePage()
class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedIndex = ref.watch(bottomNavigationIndexProvider);

    final _screens = [
      ProductsPage(),
      LogPage(),
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColor.neutral1,
        body: _screens[selectedIndex],
        bottomNavigationBar: NavigationBar(
          height: 60,
          destinations: [
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: NavigationDestination(
                icon: Icon(
                  Icons.shopping_bag,
                  color: ref.watch(bottomNavigationIndexProvider) == 0 ? AppColor.florescentGreen : AppColor.neutral4,
                ),
                label: '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28),
              child: NavigationDestination(
                icon: Icon(
                  Icons.list_alt,
                  color: ref.watch(bottomNavigationIndexProvider) == 1 ? AppColor.florescentGreen : AppColor.neutral4,
                ),
                label: '',
              ),
            ),
          ],
          indicatorColor: AppColor.neutral3,
          backgroundColor: AppColor.neutral2,
          animationDuration: const Duration(seconds: 1),
          selectedIndex: selectedIndex,
          onDestinationSelected: (index) => ref.read(bottomNavigationIndexProvider.notifier).state = index,
        ),
      ),
    );
  }
}
