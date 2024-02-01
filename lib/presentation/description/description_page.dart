import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_mvvm/data/models/ProductModel.dart';
import 'package:providers_mvvm/viewmodel/product_view_model.dart';

class DescriptionPage extends StatefulWidget {
  ProductModel product;

  DescriptionPage({required this.product, super.key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  void initState() {
    context.read<ProductViewModel>().getSingleProduct(widget.product.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Description page")),
      body: Consumer<ProductViewModel>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if (value.product != null) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Image.network(widget.product.image),
                    const SizedBox(height: 20,),
                    Text(widget.product.title, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
                    Text(widget.product.description, style: const TextStyle(color:Colors.grey,fontSize: 16),textAlign: TextAlign.center,),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${widget.product.rating.rate}⭐"),
                        Text("${widget.product.price}USD", style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w500, fontSize: 20),),
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
