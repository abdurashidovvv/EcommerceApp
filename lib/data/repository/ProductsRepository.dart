import 'package:providers_mvvm/data/models/ProductModel.dart';
import 'package:providers_mvvm/networking/api_service.dart';

class ProductsRepository{
  Future<List<ProductModel>> getAllProducts()async{
    return await ApiService().getAllProducts();
  }
  
  Future<ProductModel> getSingleProduct(int id) async {
    return await ApiService().getSingleProduct(id);
  }
}