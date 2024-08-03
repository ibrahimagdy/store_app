import '../helper/api.dart';
import 'package:store_app/model/product_model.dart';

class UpdateProductService {
  Future<dynamic> updateProduct({
    required int id,
    required String title,
    required String price,
    required String description,
    required String image,
    required String category,
  }) async {
    print('product id  = $id');
    Map<String,dynamic> data = await Api().putRequest(
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
