import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchHoodies() async {
    final snapshot = await _firestore
        .collection('products')
        .get();

    return snapshot.docs
        .map((doc) => Product.fromJson(doc.data(), docId: doc.id))
        .toList();
  }
}
