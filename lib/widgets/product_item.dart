import 'package:flutter/material.dart';
import '../models/product.dart';
import '../screens/product_detail.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';


class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => ProductDetailScreen(product: product),
      )),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius:
                BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(product.title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(
                    '₹${product.price.toStringAsFixed(0)}',
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                  SizedBox(height: 4),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                    ),
                    onPressed: () {
                      Provider.of<CartProvider>(context, listen: false).addItem(
                        product.id,
                        product.title,
                        product.price,
                        product.imageUrl,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Added to cart!'),
                        duration: Duration(seconds: 1),
                      ));
                    },
                    child: Text('Add to Cart', style: TextStyle(color: Colors.white),),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
