import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_mvvm/data/models/ProductModel.dart';
import 'package:providers_mvvm/presentation/products/widgets/product_item.dart';
import 'package:providers_mvvm/viewmodel/products_view_model.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    var myProvider = context.read<ProductsViewModel>();
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductsViewModel>().getAllProducts();
        },
        child: const Icon(Icons.refresh),
      ),
      body: Consumer<ProductsViewModel>(builder: (context, myProvider, child) {
        if (myProvider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        }
        if (myProvider.products.isNotEmpty) {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
                childAspectRatio: 3 / 4.5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: myProvider.products.length,
            itemBuilder: (context, index) =>
                ProductItem(product: myProvider.products[index]),
          );
        } else {
          return Text("Data yoq");
        }
      }),
    );
  }
}
