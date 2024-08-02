import '../helper/api.dart';
import 'package:store_app/model/product_model.dart';

class UpdateProductService {
  Future<dynamic> updateProduct({
    required String id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    Map<String,String> data = await Api().putRequest(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': description,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
