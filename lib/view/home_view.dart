import 'package:flutter/material.dart';
import 'package:store_app/core/widgets/custom_card.dart';

class HomeView extends StatelessWidget {
  static const String id = 'HomeView';

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New Trend',
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 60),
        child: GridView.builder(
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.3,
            mainAxisSpacing: 60,
            crossAxisSpacing: 10
          ),
          itemBuilder: (context, index) {
            return const CustomCard();
          },
        ),
      ),
    );
  }
}
