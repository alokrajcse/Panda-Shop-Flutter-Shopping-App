import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  final List<String> featuredImages = [
    'https://sj.sunderland.ac.uk/images/internal-websites/sls/student-financial-advice/panda-banner-long.png',
    'https://tse1.mm.bing.net/th/id/OIP.pqbH-9rP_ME-4k1qlMMaBgHaE8?rs=1&pid=ImgDetMain&cb=idpwebp2&o=7&rm=3',
    'https://th.bing.com/th/id/R.43d59b97e0257c1ebf9c7a1598720b8c?rik=2l4OgiK3IHgjCQ&riu=http%3a%2f%2fstatic.vectorcharacters.net%2fuploads%2f2012%2f03%2fCute_Panda_Cartoon_Character.jpg&ehk=7tBdKLp%2f5uAA8x%2f6EM9VtDA4IGJALFVOC27WpMagvD0%3d&risl=&pid=ImgRaw&r=0',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: PageView.builder(
        itemCount: featuredImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                featuredImages[index],
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}
