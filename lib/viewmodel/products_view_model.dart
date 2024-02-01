import 'package:flutter/material.dart';
import 'package:providers_mvvm/networking/api_service.dart';

import '../data/models/ProductModel.dart';

class ProductsViewModel extends ChangeNotifier {

  ProductsViewModel(){
    getAllProducts();
  }

  List products = [];

  bool isLoading = false;

  void getAllProducts() async {
    changeLoadingState();
    products = await ApiService().getAllProducts();
    notifyListeners();
    changeLoadingState();
  }

  void changeLoadingState(){
    isLoading = !isLoading;
  }
}
