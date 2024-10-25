import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../components/product_card.dart';

class ConcertItem extends StatelessWidget {
  ConcertItem({super.key});

  final List<Map<String, dynamic>> pastConcerts = [
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/c5fa/6c44/258b3d0924f2fe2e0cf8057c04975d28?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OB799TZD4v7zaRJG3Zq2OKRREfC4IcnSOLoNcVWq11W9PYttRWDpeF-U1I9WhRxE7XyL3FDm44EkE~VFL1Y636UJ8CpeCSDz1GTZaAPMzBkfzHJQbJIojIgZSIGU1bqbB-BuiJyMHEia6xJd8VIp0OEMRCJEHlNpu2600eLkTV3Cn7JzflysNJMV1av2tko6tRySpnDcvBOKGsAKcJmqmmyU80pPgESsIs6KGMKYxE~~5TE44LpNgppkHE8~RNiJ3AR2q5eJ9uXuyGIsMfCcLN0NTsxyIfYkcJWxHPxmUcboPq9x6gSDpow-brDdIMi5kbqSB-jCCLvmBdRKxAEa3w__',
      'title': 'ЛУЖНИКИ 12.10.2021',
      'price': ''
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/c5fa/6c44/258b3d0924f2fe2e0cf8057c04975d28?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OB799TZD4v7zaRJG3Zq2OKRREfC4IcnSOLoNcVWq11W9PYttRWDpeF-U1I9WhRxE7XyL3FDm44EkE~VFL1Y636UJ8CpeCSDz1GTZaAPMzBkfzHJQbJIojIgZSIGU1bqbB-BuiJyMHEia6xJd8VIp0OEMRCJEHlNpu2600eLkTV3Cn7JzflysNJMV1av2tko6tRySpnDcvBOKGsAKcJmqmmyU80pPgESsIs6KGMKYxE~~5TE44LpNgppkHE8~RNiJ3AR2q5eJ9uXuyGIsMfCcLN0NTsxyIfYkcJWxHPxmUcboPq9x6gSDpow-brDdIMi5kbqSB-jCCLvmBdRKxAEa3w__',
      'title': 'ЛУЖНИКИ 15.09.2021',
      'price': ''
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/c5fa/6c44/258b3d0924f2fe2e0cf8057c04975d28?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OB799TZD4v7zaRJG3Zq2OKRREfC4IcnSOLoNcVWq11W9PYttRWDpeF-U1I9WhRxE7XyL3FDm44EkE~VFL1Y636UJ8CpeCSDz1GTZaAPMzBkfzHJQbJIojIgZSIGU1bqbB-BuiJyMHEia6xJd8VIp0OEMRCJEHlNpu2600eLkTV3Cn7JzflysNJMV1av2tko6tRySpnDcvBOKGsAKcJmqmmyU80pPgESsIs6KGMKYxE~~5TE44LpNgppkHE8~RNiJ3AR2q5eJ9uXuyGIsMfCcLN0NTsxyIfYkcJWxHPxmUcboPq9x6gSDpow-brDdIMi5kbqSB-jCCLvmBdRKxAEa3w__',
      'title': 'ЛУЖНИКИ 20.08.2021',
      'price': ''
    }
  ];

  final List<Map<String, dynamic>> upcomingConcerts = [
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/99e1/1134/2353a21137ae55dbdfd87880746af597?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ifKZ7MloMOVqcR0vVPW-aLGOUfVcgw980YoFKxOj6uxEK0HRpPbAutDTGBq6tDCbjNa6QjRh9o7kOQfUCpXUeo1rL9AtKhUaK~iFqxC8vbaeLRWBcS1dVC8W2f2N0KG6h80XTNf56MlBegpwFhgtE7EShC8lIudux~gMus8xDg3VxchFlHAYmZEN25c5USvkubZTScf4k-4xhaqC312PJSi4bDMOQpc1kn8Pr8gFIX7~ZLOK0eROAvQXnWk4TMKWTPGNsdblF-L4sBl7HdjmSyOdAPHRNLY7GANrzSJL8UMZcKBartEzqwHWdy1KPwW4JxNutPkau46Vxu0n-S3HzQ__',
      'title': 'МТС LIVE ХОЛЛ',
      'price': '30.12.2024'
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/99e1/1134/2353a21137ae55dbdfd87880746af597?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ifKZ7MloMOVqcR0vVPW-aLGOUfVcgw980YoFKxOj6uxEK0HRpPbAutDTGBq6tDCbjNa6QjRh9o7kOQfUCpXUeo1rL9AtKhUaK~iFqxC8vbaeLRWBcS1dVC8W2f2N0KG6h80XTNf56MlBegpwFhgtE7EShC8lIudux~gMus8xDg3VxchFlHAYmZEN25c5USvkubZTScf4k-4xhaqC312PJSi4bDMOQpc1kn8Pr8gFIX7~ZLOK0eROAvQXnWk4TMKWTPGNsdblF-L4sBl7HdjmSyOdAPHRNLY7GANrzSJL8UMZcKBartEzqwHWdy1KPwW4JxNutPkau46Vxu0n-S3HzQ__',
      'title': 'STADIUM LIVE',
      'price': '15.01.2025'
    },
    {
      'image':
          'https://s3-alpha-sig.figma.com/img/99e1/1134/2353a21137ae55dbdfd87880746af597?Expires=1730678400&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ifKZ7MloMOVqcR0vVPW-aLGOUfVcgw980YoFKxOj6uxEK0HRpPbAutDTGBq6tDCbjNa6QjRh9o7kOQfUCpXUeo1rL9AtKhUaK~iFqxC8vbaeLRWBcS1dVC8W2f2N0KG6h80XTNf56MlBegpwFhgtE7EShC8lIudux~gMus8xDg3VxchFlHAYmZEN25c5USvkubZTScf4k-4xhaqC312PJSi4bDMOQpc1kn8Pr8gFIX7~ZLOK0eROAvQXnWk4TMKWTPGNsdblF-L4sBl7HdjmSyOdAPHRNLY7GANrzSJL8UMZcKBartEzqwHWdy1KPwW4JxNutPkau46Vxu0n-S3HzQ__',
      'title': 'ADRENALINE STADIUM',
      'price': '28.02.2025'
    }
  ];

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
        CarouselSlider.builder(
          itemCount: pastConcerts.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.5),
              child: ProductCard(
                imageUrl: pastConcerts[index]['image'],
                title: pastConcerts[index]['title'],
                price: pastConcerts[index]['price'],
                showCartButton: false,
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
        Container(
          margin: const EdgeInsets.only(left: 16.0, right: 16.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
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
        CarouselSlider.builder(
          itemCount: upcomingConcerts.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.5),
              child: ProductCard(
                imageUrl: upcomingConcerts[index]['image'],
                title: upcomingConcerts[index]['title'],
                price: upcomingConcerts[index]['price'],
                showCartButton: true,
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
    );
  }
}
