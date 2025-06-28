import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';

class SearchScreen extends StatefulWidget {
  final List<Product> allProducts;

  const SearchScreen({Key? key, required this.allProducts}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredProducts = widget.allProducts
        .where((prod) =>
        prod.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              query = value;
            });
          },
        ),
        backgroundColor: Colors.pinkAccent,
      ),
      body: filteredProducts.isEmpty
          ? Center(child: Text('No products found.'))
          : GridView.builder(
        padding: EdgeInsets.all(8),
        itemCount: filteredProducts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ProductItem(product: filteredProducts[i]),
      ),
    );
  }
}
