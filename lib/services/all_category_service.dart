import '../helper/api.dart';

class AllCategoryService{
  Future<List<dynamic>> getAllCategory() async{
    List<dynamic> data = await Api().getRequest(url: 'https://fakestoreapi.com/products/categories');
      return data;
   }
}