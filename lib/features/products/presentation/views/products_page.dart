import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rolla_task/common/providers/repository_provider.dart';
import 'package:rolla_task/domain/models/product.dart';
import 'package:rolla_task/domain/models/user.dart';
import 'package:rolla_task/features/authentication/providers/user_provider.dart';
import 'package:rolla_task/features/products/presentation/widgets/products_card.dart';
import 'package:rolla_task/resources.dart';
import 'package:rolla_task/routing/app_router.gr.dart';

final userDataProvider =
    StateNotifierProvider<UserNotifier, AsyncValue<User>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return UserNotifier(authRepository);
});

@RoutePage()
class ProductsPage extends HookConsumerWidget {
  const ProductsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncerTimer = useState<Timer?>(null);
    final productsRepository = ref.watch(productRepositoryProvider);

    final userData = ref.watch(userDataProvider);
    final avatarUrl = userData.value?.image;

    final pagingController = useMemoized(
      () => PagingController<int, Product>(firstPageKey: 0),
    );

    final form = useRef(
      FormGroup({
        'search': FormControl<String>(),
      }),
    );

    form.value.control('search').valueChanges.listen((event) {
      if (debouncerTimer.value != null) {
        debouncerTimer.value?.cancel();
      }
      debouncerTimer.value = Timer(const Duration(milliseconds: 500), () {
        pagingController.refresh();
      });
    });

    Future<void> fetchPage(int pageKey) async {
      const pageSize = 15;
      try {
        final newItems = await productsRepository.fetchProducts(
          skip: pageKey,
          limit: pageSize,
          search: form.value.control('search').value ?? '',
        );
        final isLastPage = newItems.length < pageSize;
        if (isLastPage) {
          pagingController.appendLastPage(newItems);
        } else {
          final nextPageKey = pageKey + newItems.length;
          pagingController.appendPage(newItems, nextPageKey);
        }
      } catch (error) {
        pagingController.error = error;
      }
    }

    useEffect(() {
      pagingController.addPageRequestListener((pageKey) {
        fetchPage(pageKey);
      });
      return () {
        pagingController.dispose();
      };
    }, [pagingController]);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Products',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          avatarUrl != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.account_circle),
                    color: Colors.white,
                    onPressed: () {
                      context.router.push(
                        UserDetailsPage(
                          onSignOut: () {},
                        ),
                      );
                    },
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    context.router.push(
                      UserDetailsPage(
                        onSignOut: () {},
                      ),
                    );
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl ?? ''),
                    backgroundColor: AppColor.neutral4,
                  ),
                ),
        ],
        backgroundColor: AppColor.neutral1,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ReactiveForm(
              formGroup: form.value,
              child: ReactiveTextField(
                formControlName: 'search',
                decoration: InputDecoration(
                  labelText: 'Search product...',
                  labelStyle: const TextStyle(
                    color: AppColor.neutral4,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: const TextStyle(
                  color: AppColor.neutral4,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppColor.neutral1,
      body: Center(
        child: PagedListView<int, Product>(
          pagingController: pagingController,
          builderDelegate: PagedChildBuilderDelegate<Product>(
            itemBuilder: (context, item, index) => ProductsCard(
              title: item.title ?? '',
              brand: item.brand,
              price: item.price,
            ),
          ),
        ),
      ),
    );
  }
}
