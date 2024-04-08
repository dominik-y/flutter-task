import 'package:rolla_task/domain/models/product.dart';
import 'package:rolla_task/domain/remote/apis/product_api.dart';

class ProductRepository {
  final ProductApi _productApi;

  ProductRepository(this._productApi);

  Future<List<Product>> fetchProducts(
      {String? search, int? skip, int? limit}) async {
    final productResponse =
        await _productApi.getProducts(search: search, skip: skip, limit: limit);
    return productResponse.products;
  }
}
