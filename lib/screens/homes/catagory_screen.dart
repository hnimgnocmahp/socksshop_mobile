import 'package:flutter/material.dart';
import 'package:socks_shop/models/product.dart';
import 'package:socks_shop/screens/homes/product_list_screen.dart';
import 'package:socks_shop/repositories/product_repository.dart';

final _productRepo = ProductRepository();

class CategoryScreen extends StatefulWidget {
  final Future<List<Product>>? cachedFuture;

  const CategoryScreen({super.key, this.cachedFuture});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<List<Product>> hoodiesFuture;

  @override
  void initState() {
    super.initState();
    hoodiesFuture = widget.cachedFuture ?? _productRepo.fetchHoodies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              const SizedBox(height: 20),
              const Text("Shop by Categories", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 14),
              Expanded(
                child: ListView(
                  children: [
                    _buildCategoryItem(context, 'Hoodies', 'assets/images/Ellipse5.png', hoodiesFuture),
                    _buildCategoryItem(context, 'Shoes', 'assets/images/Ellipse5.png', hoodiesFuture),
                    _buildCategoryItem(context, 'T-Shirts', 'assets/images/Ellipse5.png', hoodiesFuture),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, String title, String imagePath, Future<List<Product>> futureProducts) {
    return FutureBuilder<List<Product>>(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: CircularProgressIndicator(),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Lỗi khi tải sản phẩm'),
          );
        }

        final listProduct = snapshot.data!;
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductListScreen(title: title, listProduct: listProduct),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Image.asset(imagePath, height: 40, width: 40),
                const SizedBox(width: 16),
                Text(title, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        );
      },
    );
  }
}