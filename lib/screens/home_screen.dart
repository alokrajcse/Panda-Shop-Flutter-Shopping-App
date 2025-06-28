import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pandashop/screens/search_screen.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
import '../widgets/categories.dart';
import '../widgets/carousel.dart';

class HomeScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 'p1',
      title: 'Cute Panda Toy',
      description: 'Soft and adorable panda toy for kids.',
      price: 499.0,
      imageUrl: 'https://tse1.mm.bing.net/th/id/OIP.DtZR9EzWiVYzd4iBj4YtJQHaHa?rs=1&pid=ImgDetMain&cb=idpwebp2&o=7&rm=3',
      category: 'Toys',
    ),
    Product(
      id: 'p2',
      title: 'Panda T-shirt',
      description: 'Comfortable panda print t-shirt.',
      price: 299.0,
      imageUrl: 'https://th.bing.com/th/id/OIP.fsRgSj_IDK-HKhtWEkxqLwHaI4?w=159&h=190&c=7&r=0&o=7&dpr=1.4&pid=1.7&rm=3',
      category: 'Clothing',
    ),
    Product(
      id: 'p3',
      title: 'Panda Mug',
      description: 'Ceramic mug with cute panda design.',
      price: 199.0,
      imageUrl: 'https://tse3.mm.bing.net/th/id/OIP.MuovCwj9RnttEfDQd0W_qgHaHa?rs=1&pid=ImgDetMain&cb=idpwebp2&o=7&rm=3',
      category: 'Home',
    ),
    Product(
      id: 'p4',
      title: 'Panda Pillow',
      description: 'Soft panda printed pillow for cozy sleep.',
      price: 399.0,
      imageUrl: 'https://tse4.mm.bing.net/th/id/OIP.ZtyuJNSLUWSd8b6iA8eQJAHaHa?rs=1&pid=ImgDetMain&cb=idpwebp2&o=7&rm=3',
      category: 'Home',
    ),
    Product(
      id: 'p5',
      title: 'Panda Hoodie',
      description: 'Warm panda themed hoodie.',
      price: 899.0,
      imageUrl: 'https://th.bing.com/th/id/R.f24fba63a31f6c96343d3b93e665138d?rik=gOo94qPlFFmpUw&riu=http%3a%2f%2fimg.ltwebstatic.com%2fimages%2fpi%2f201709%2fe8%2f15048327771354306618.jpg&ehk=xsaDZ4DjgJqHa1fi6DyD%2fsSD9W4KogYJMp3ZPZKNTCM%3d&risl=&pid=ImgRaw&r=0',
      category: 'Clothing',
    ),
    Product(
      id: 'p6',
      title: 'Panda Notebook',
      description: 'Cute panda printed notebook for notes.',
      price: 99.0,
      imageUrl: 'https://i.etsystatic.com/21122400/r/il/2e8a74/3215317579/il_1588xN.3215317579_pic8.jpg',
      category: 'Stationary',
    ),
  ];

  final List<String> categories = ['Toys', 'Clothing', 'Home', 'Accessories'];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.pinkAccent, // pink status bar
        statusBarIconBrightness: Brightness.light, // white icons
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '🐼 Panda Shop',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => SearchScreen(allProducts: products),
                ));
              },
            ),
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pinkAccent, Colors.pink.shade200],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10),

                // Carousel
                Carousel(),

                SizedBox(height: 10),

                // Categories
                Categories(categories: categories),

                SizedBox(height: 10),

                // Products Grid
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (ctx, i) => ProductItem(product: products[i]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
