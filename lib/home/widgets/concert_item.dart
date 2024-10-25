import 'package:flutter/material.dart';
import '../components/product_card.dart';

class ConcertItem extends StatelessWidget {
  const ConcertItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Text(
            'ПРОШЕДШИЕ КОНЦЕРТЫ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ProductCard(
          imageUrl: 'assets/images/concert.jpg',
          title: 'ЛУЖНИКИ 12.10.2021',
          price: '',
          showCartButton: false,
          imageHeight: 200,
          margin: const EdgeInsets.all(16.0),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Text(
            'ПРЕДСТОЯЩИЕ КОНЦЕРТЫ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ProductCard(
          imageUrl: 'assets/images/upcoming_concert.jpg',
          title: 'МТС LIVE ХОЛЛ',
          price: '30.12.2024',
          showCartButton: true,
          imageHeight: 200,
          margin: const EdgeInsets.all(16.0),
        ),
      ],
    );
  }
}
