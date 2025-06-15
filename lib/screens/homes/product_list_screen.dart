import 'package:flutter/material.dart';
import 'package:socks_shop/models/product.dart';

class ProductListScreen extends StatefulWidget {
  final String title;
  final List<Product> listProduct;

  const ProductListScreen({
    super.key,
    required this.title,
    required this.listProduct,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreen();
}

class _ProductListScreen extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(height: 8),

              // Title
              Text(
                '${widget.title} (${widget.listProduct.length})',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Grid of products
              Expanded(
                child: GridView.builder(
                  itemCount: widget.listProduct.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    final product = widget.listProduct[index];
                    return _buildProductItem(product.name, product.price, product.imageUrls[0]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(String name, double price, String imagePath){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[100],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with heart icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite_border, color: Colors.black),
              ),
            ],
          ),

          // Product title and price
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 6),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}