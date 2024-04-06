import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rolla_task/features/authentication/providers/user_provider.dart';
import 'package:rolla_task/routing/app_router.dart';

import 'domain/models/user.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionNotifier = ref.watch(userProvider.notifier);
    final user = ref.watch(userProvider);
    final router = useState(AppRouter(sessionNotifier: sessionNotifier));

    // final userListenable = useState<User?>(null);

    // useEffect(() {
    //   user.when(
    //     data: (user) {
    //       userListenable.value = user;
    //       print(user.toString());
    //     },
    //     loading: () {},
    //     error: (error, stackTrace) {},
    //   );
    //   return null;
    // }, [user]);

    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: router.value.config(),
    );
  }
}
