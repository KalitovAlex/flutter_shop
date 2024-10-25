import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../components/product_card.dart';

class FeaturedProduct extends StatelessWidget {
  FeaturedProduct({super.key});

  final List<Map<String, dynamic>> products = [
    {
      'image': 'https://via.placeholder.com/300x200',
      'title': 'КЕПКА БОБА',
      'price': '3500 руб.'
    },
    {
      'image': 'https://via.placeholder.com/300x200',
      'title': 'КЕПКА БЕЙСБОЛКА',
      'price': '3500 руб.'
    },
    {
      'image': 'https://via.placeholder.com/300x200',
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
              return ProductCard(
                imageUrl: products[index]['image'],
                title: products[index]['title'],
                price: products[index]['price'],
                imageHeight: 200,
              );
            },
            options: CarouselOptions(
              height: 350,
              viewportFraction: 0.85,
            ),
          ),
        ],
      ),
    );
  }
}
