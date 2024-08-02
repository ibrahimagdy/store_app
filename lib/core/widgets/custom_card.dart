import 'package:flutter/material.dart';
import 'package:store_app/model/product_model.dart';

class CustomCard extends StatelessWidget{
  final ProductModel product;
  const CustomCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 50,
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0,
                    offset: const Offset(1,1)
                )
              ]
          ),
          child: Column(
            children: [
              Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16, left: 16, top: 60, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.title.substring(0,10),
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$''${product.price.toString()}',
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          right: 22,
          bottom: 105,
          child: Image.network(
            product.image,
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}