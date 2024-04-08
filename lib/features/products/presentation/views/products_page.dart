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
import 'package:rolla_task/features/products/presentation/widgets/products_card.dart';
import 'package:rolla_task/features/user_details/presentation/views/user_details_page.dart';
import 'package:rolla_task/resources.dart';

@RoutePage()
class ProductsPage extends HookConsumerWidget {
  final String? userAvatar;

  const ProductsPage({
    super.key,
    this.userAvatar,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final debouncerTimer = useState<Timer?>(null);
    final productsRepository = ref.watch(productRepositoryProvider);
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
          userAvatar == null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.account_circle),
                    color: Colors.white,
                    onPressed: () {
                      //context.router.push(UserDetailsPage());
                    },
                  ),
                )
              : ElevatedButton(
                  onPressed: () {
                    //context.router.push(UserDetailsPage());
                  },
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://robohash.org/Jeanne.png?set=set4'), // ! wrapper fix it
                    backgroundColor: AppColor.white,
                  ),
                )
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
