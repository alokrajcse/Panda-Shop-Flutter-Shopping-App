import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final List<String> categories;

  const Categories({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (ctx, i) => Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.pink.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            categories[i],
            style: TextStyle(color: Colors.pinkAccent, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
