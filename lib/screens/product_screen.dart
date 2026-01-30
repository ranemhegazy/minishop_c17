import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import 'cart_screen.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<Product> fruits = [

    Product(
      name: 'Apple',
      price: 10,
      image: 'assets/images/apple.png.jpeg',
    ),
    Product(
      name: 'Banana',
      price: 8,
      image: 'assets/images/banana.png.jpeg',
    ),
    Product(
      name: 'Orange',
      price: 12,
      image: 'assets/images/orange.png.jpeg',
    ),
    Product(
      name: 'Mango',
      price: 20,
      image: 'assets/images/mango.png.jpeg',
    ),
    Product(
      name: 'Strawberry',
      price: 18,
      image: 'assets/images/strawberry.png.jpeg',
    ),
    Product(
      name: 'Pineapple',
      price: 22,
      image: 'assets/images/pineapple.png.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruits',
          style: TextStyle(
            fontSize: 26, // حجم أكبر
            fontWeight: FontWeight.bold, // خط واضح
            color: Colors.black, // لو عايزة اللون أبيض
        ),
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                  if (cart.cartCount > 0)
                    Positioned(
                      right: 6,
                      top: 6,
                      child: CircleAvatar(
                        radius: 9,
                        child: Text(
                          cart.cartCount.toString(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // صورة واحدة في الصف
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: fruits.length,
        itemBuilder: (context, index) {
          final fruit = fruits[index];

          return GestureDetector(
            onTap: () {
              context.read<CartProvider>().addProduct(fruit);
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(fruit.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          fruit.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22),
                        ),
                        Text(
                          'Price: ${fruit.price}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 32,
                    ),
                    onPressed: () {
                      context.read<CartProvider>().addProduct(fruit);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
