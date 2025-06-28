import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final cartItems = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.pinkAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              cart.clear();
            },
          )
        ],
      ),
      body: cart.itemCount == 0
          ? Center(child: Text('Your cart is empty 🛒'))
          : ListView.builder(
        itemCount: cart.itemCount,
        itemBuilder: (ctx, i) => ListTile(
          leading: Image.network(cartItems[i].imageUrl, width: 50),
          title: Text(cartItems[i].title),
          subtitle: Text(
              '${cartItems[i].quantity} x ₹${cartItems[i].price.toStringAsFixed(0)}'),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              cart.removeItem(cart.items.keys.toList()[i]);
            },
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: ₹${cart.totalAmount.toStringAsFixed(0)}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (cart.itemCount == 0) return;

                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Order Placed!'),
                    content: Text('Thank you for shopping with Panda Shop 🐼'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          cart.clear();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.pinkAccent,
              ),
              child: Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
