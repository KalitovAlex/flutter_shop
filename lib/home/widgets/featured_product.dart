import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../components/product_card.dart';

class FeaturedProduct extends StatelessWidget {
  FeaturedProduct({super.key});

  final List<Map<String, dynamic>> products = [
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/f2f7/5ea5/8e4a59b04b40f74cf979a8fe0b267a36?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WxJ47xe6YGbuUIkpGv0MkGMPzlXfyV~ZwMqVSN9aSC286mzxIa-RiQHBePfIW2z0fVu6IhZxyRYb38RHJ9qW7LXK2nfBnQ9xToVW-U0jVKdLF64CW-8FU9vWaDHbw5yBDB-yIh055Na3v1HLLcSVijt7l~FRYhcE2BLIk47xrRfVUKcf91JXqyC-uWZtsAl0GFIaFsdCi438c-WpeJyu0nSySInte3Mip-~81ljaDZJyb-Muy8HpoLX08~3QOCros8d1KDyb0oDCdh8hhxgCCdpkdD-WiBOEaHPFWT~mD3yZKUkLBDtEk5ft0LrM6mNwNvKUKHtl~xGWciITLGnXwQ__',
      'title': 'КЕПКА БОБА',
      'price': '3500 руб.'
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/7b63/01e3/b3b23a9b17cc02aac8a160d85bff1dfb?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=P4CXnYtAGt65CPqyA2SxeVj0H46wKGaAeV1RuXeQGJ-nTaUIgyKCzDb-8LpgHRm61p~4g9-8k8EF67u3wGm0h-MtsU7kaDJaWz~CeNvBtUy5dJstvAV5QTmaWWtH8h-~TJ6ZOL9o~6yWMZ4iHutQ4NMzYYysZvAqPhZR9RyUFnYsaIlNKV0nyp3rcN-QGMlezar13px8Z--7nIqCa-o69UeisA9LXVetOh-Fk~3f0XrJldw2QBSCPzU9GoyonlZ22HeIKCYuGDchJ0QHqH5ZQj-cEbONQ4rN4oA3DQQa-lOKKMcbLAAlPEd3EknB0nfaYby9JYos~5mf~JiFULSUQw__',
      'title': 'КЕПКА БЕЙСБОЛКА',
      'price': '3500 руб.'
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/7b63/01e3/b3b23a9b17cc02aac8a160d85bff1dfb?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=P4CXnYtAGt65CPqyA2SxeVj0H46wKGaAeV1RuXeQGJ-nTaUIgyKCzDb-8LpgHRm61p~4g9-8k8EF67u3wGm0h-MtsU7kaDJaWz~CeNvBtUy5dJstvAV5QTmaWWtH8h-~TJ6ZOL9o~6yWMZ4iHutQ4NMzYYysZvAqPhZR9RyUFnYsaIlNKV0nyp3rcN-QGMlezar13px8Z--7nIqCa-o69UeisA9LXVetOh-Fk~3f0XrJldw2QBSCPzU9GoyonlZ22HeIKCYuGDchJ0QHqH5ZQj-cEbONQ4rN4oA3DQQa-lOKKMcbLAAlPEd3EknB0nfaYby9JYos~5mf~JiFULSUQw__',
      'title': 'КЕПКА SNAPBACK',
      'price': '3500 руб.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'ПОПУЛЯРНОЕ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CarouselSlider.builder(
            itemCount: products.length,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ProductCard(
                  imageUrl: products[index]['image'],
                  title: products[index]['title'],
                  price: products[index]['price'],
                  imageHeight: 200,
                ),
              );
            },
            options: CarouselOptions(
              height: 350,
              viewportFraction: 0.8,
              padEnds: true,
              enableInfiniteScroll: false,
            ),
          ),
        ],
      ),
    );
  }
}
