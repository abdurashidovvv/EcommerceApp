import 'package:flutter/material.dart';
import 'package:providers_mvvm/data/models/ProductModel.dart';
import 'package:providers_mvvm/presentation/description/description_page.dart';

class ProductItem extends StatelessWidget {
  ProductModel product;

  ProductItem({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DescriptionPage(product: product)));
      },
      child: ListTile(
        title: Image.network(
          product.image,
          height: 140,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.title, style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black),),
            Text("${product.price} USD", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green),),
          ],
        ),
      ),
    );
  }
}
