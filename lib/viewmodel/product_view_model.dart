import 'package:flutter/material.dart';
import 'package:providers_mvvm/data/models/ProductModel.dart';
import 'package:providers_mvvm/data/repository/ProductsRepository.dart';

import '../networking/api_service.dart';

class ProductViewModel extends ChangeNotifier{
  ProductModel? product;

  bool isLoading = false;

  void getSingleProduct(int id) async {
    changeLoadingState();
    product = await ProductsRepository().getSingleProduct(id);
    print(product!.title.toString());
    notifyListeners();
    changeLoadingState();
  }

  void changeLoadingState(){
    isLoading = !isLoading;
  }
}