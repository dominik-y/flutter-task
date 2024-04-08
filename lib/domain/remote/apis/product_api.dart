import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rolla_task/domain/models/product_response.dart';
part 'product_api.g.dart';

@RestApi()
abstract class _ProductApi {
  factory _ProductApi(Dio dio) = __ProductApi;

  @GET('/products/search?q={search}')
  Future<ProductResponse> _getProducts(
    @Path('search') String? search,
    @Query('limit') int? limit,
    @Query('skip') int? skip,
  );
}

class ProductApi extends __ProductApi {
  ProductApi(Dio dio) : super(dio);

  Future<ProductResponse> getProducts({
    String? search,
    int? limit,
    int? skip,
  }) {
    return _getProducts(
      search,
      limit,
      skip,
    );
  }
}
