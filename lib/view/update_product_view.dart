import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/core/services/update_product_service.dart';
import 'package:store_app/core/widgets/custom_button.dart';
import 'package:store_app/core/widgets/custom_text_form_field.dart';
import 'package:store_app/model/product_model.dart';

class UpdateProductView extends StatefulWidget {
  static const String id = 'update';

  const UpdateProductView({super.key});

  @override
  State<UpdateProductView> createState() => _UpdateProductViewState();
}

class _UpdateProductViewState extends State<UpdateProductView> {
  String? title, price, desc, img;
  bool isLoading = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imgController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)?.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const Text(
                  'Product Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: product.title.split(' ').take(3).join(' '),
                  controller: titleController,
                  onChanged: (data) {
                    title = data;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Product Price',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: r'$' '${product.price.toString()}',
                  controller: priceController,
                  keyboardType: TextInputType.number,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Product desc',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: product.description,
                  controller: descController,
                  onChanged: (data) {
                    desc = data;
                  },
                ),
                const SizedBox(height: 16),
                const Text(
                  'Product image url',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                CustomTextFormField(
                  hintText: product.image,
                  controller: imgController,
                  onChanged: (data) {
                    img = data;
                  },
                ),
                const SizedBox(height: 50),
                CustomButton(
                  buttonText: 'Update',
                  buttonColor: const Color(0xffeeea1f),
                  onTap: () async {
                    isLoading = true;
                    setState(() {
                    });
                    try {
                      await updateProduct(product);
                    } catch (e) {
                      print(e.toString());
                    }
                    isLoading = false;
                    setState(() {
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future <void> updateProduct(ProductModel product) async{
    await UpdateProductService().updateProduct(
      id: product.id,
      title: title == null ? product.title : title!,
      price: price == null ? product.price.toString() : price!,
      description: desc == null ? product.description : desc!,
      image: img == null ? product.image : img!,
      category: product.category,
    );
  }
}

