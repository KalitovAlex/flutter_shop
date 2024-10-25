import 'package:flutter/material.dart';

class ProductCategories extends StatelessWidget {
  const ProductCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCategoryCard(
          image:
              'https://s3-alpha-sig.figma.com/img/f2f7/5ea5/8e4a59b04b40f74cf979a8fe0b267a36?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WxJ47xe6YGbuUIkpGv0MkGMPzlXfyV~ZwMqVSN9aSC286mzxIa-RiQHBePfIW2z0fVu6IhZxyRYb38RHJ9qW7LXK2nfBnQ9xToVW-U0jVKdLF64CW-8FU9vWaDHbw5yBDB-yIh055Na3v1HLLcSVijt7l~FRYhcE2BLIk47xrRfVUKcf91JXqyC-uWZtsAl0GFIaFsdCi438c-WpeJyu0nSySInte3Mip-~81ljaDZJyb-Muy8HpoLX08~3QOCros8d1KDyb0oDCdh8hhxgCCdpkdD-WiBOEaHPFWT~mD3yZKUkLBDtEk5ft0LrM6mNwNvKUKHtl~xGWciITLGnXwQ__', // Путь к изображению кепки
          title: 'CAPS',
        ),
        _buildCategoryCard(
          image:
              'https://s3-alpha-sig.figma.com/img/7b63/01e3/b3b23a9b17cc02aac8a160d85bff1dfb?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=P4CXnYtAGt65CPqyA2SxeVj0H46wKGaAeV1RuXeQGJ-nTaUIgyKCzDb-8LpgHRm61p~4g9-8k8EF67u3wGm0h-MtsU7kaDJaWz~CeNvBtUy5dJstvAV5QTmaWWtH8h-~TJ6ZOL9o~6yWMZ4iHutQ4NMzYYysZvAqPhZR9RyUFnYsaIlNKV0nyp3rcN-QGMlezar13px8Z--7nIqCa-o69UeisA9LXVetOh-Fk~3f0XrJldw2QBSCPzU9GoyonlZ22HeIKCYuGDchJ0QHqH5ZQj-cEbONQ4rN4oA3DQQa-lOKKMcbLAAlPEd3EknB0nfaYby9JYos~5mf~JiFULSUQw__', // Путь к изображению футболки
          title: 'T SHIRTS',
        ),
      ],
    );
  }

  Widget _buildCategoryCard({required String image, required String title}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              image,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'YourCustomFont', // Замените на ваш шрифт
                    ),
                  ),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: const BoxDecoration(
                      color: Color(0xFFB71C1C),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
