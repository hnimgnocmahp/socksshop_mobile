import 'package:flutter/material.dart';
import 'package:socks_shop/models/product.dart';
import 'package:socks_shop/screens/homes/product_list_screen.dart';
import 'package:socks_shop/repositories/product_repository.dart';
import 'catagory_screen.dart';

final _productRepo = ProductRepository();
final List<Map<String, String>> topSelling = [
  {
    'name': "Men's Harrington Jacket",
    'price': "\$148.00",
    'image': 'assets/jacket.png',
  },
  {
    'name': "Max Cirro Men's Slides",
    'price': "\$55.00",
    'image': 'assets/slides.png',
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> hoodiesFuture;
  @override
  void initState() {
    super.initState();
    hoodiesFuture = _productRepo.fetchHoodies(); // Gọi 1 lần duy nhất
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE2BCB7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildCategories(),
              _buildTopSelling(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/user.png'),
            radius: 20,
          ),
          DropdownButton<String>(
            value: 'Men',
            underline: SizedBox(),
            items: ['Men', 'Women'].map((e) => DropdownMenuItem(
              value: e,
              child: Text(e, style: TextStyle(fontSize: 16)),
            )).toList(),
            onChanged: (value) {},
          ),
          CircleAvatar(
            backgroundColor: Colors.purple,
            child: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          filled: true,
          fillColor: Colors.grey.shade100,
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Categories", (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen()));
        }),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 15),
            children: [
              _buildCategoryItem(Icons.checkroom, 'Hoodies'),
              SizedBox(width: 22),
              _buildCategoryItem(Icons.short_text, 'Shorts'),
              SizedBox(width: 22),
              _buildCategoryItem(Icons.directions_run, 'Shoes'),
              SizedBox(width: 22),
              _buildCategoryItem(Icons.shopping_bag, 'Bag'),
              SizedBox(width: 22),
              _buildCategoryItem(Icons.watch, 'Accessories'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                ProductListScreen(title: label, listProduct: []),
            ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            child: Icon(icon, size: 30, color: Colors.grey),
          ),
          SizedBox(height: 5),
          Text(label, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12)),
        ],
      ),
    );
  }


  Widget _buildTopSelling() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("Top Selling", (){

        }),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: topSelling.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final product = topSelling[index];
              return Container(
                width: 160,
                margin: EdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.grey.shade200,
                          image: DecorationImage(
                            image: AssetImage(product['image']!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(product['name']!, maxLines: 2, overflow: TextOverflow.ellipsis),
                    SizedBox(height: 4),
                    Text(product['price']!, style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onSeeAllPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          GestureDetector(
            onTap: onSeeAllPressed,
            child: Text("See All", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
          ),

        ],
      ),
    );
  }
}



