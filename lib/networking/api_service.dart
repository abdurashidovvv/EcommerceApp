import 'package:dio/dio.dart';
import 'package:providers_mvvm/data/models/ProductModel.dart';

class ApiService {
  Future getAllProducts() async {
    Dio dio = Dio();
    Response response = await dio.get("https://fakestoreapi.com/products");

    if (response.statusCode == 200) {
      List products =
          response.data.map((json) => ProductModel.fromJson(json)).toList();
      return products;
    }
  }

  Future getSingleProduct(int id) async {
    Dio dio = Dio();
    Response response=await dio.get("https://fakestoreapi.com/products/$id");
    if(response.statusCode ==200){
      return ProductModel.fromJson(response.data);
    }
  }
}
