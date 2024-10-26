import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_shop/cart/service/cart_service.dart';
import 'package:flutter_shop/core/router/router.dart';
import '../components/product_card.dart';
import '../bloc/concert_bloc.dart';
import '../models/concert_model.dart';
import 'package:auto_route/auto_route.dart';
import '../../core/utils/image_utils.dart';

class ConcertItem extends StatelessWidget {
  const ConcertItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConcertBloc, ConcertState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            context.read<ConcertBloc>().loadConcerts();
            return const Center(child: CircularProgressIndicator());
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (message) => Center(child: Text('Error: $message')),
          loaded: (concerts) => _buildConcertsList(concerts),
        );
      },
    );
  }

  Widget _buildConcertsList(List<ConcertModel> concerts) {
    final now = DateTime.now();
    final pastConcerts = concerts
        .where((concert) => DateTime.parse(concert.date).isBefore(now))
        .toList()
      ..sort((a, b) => DateTime.parse(b.date)
          .compareTo(DateTime.parse(a.date))); // Сортировка по убыванию даты

    final upcomingConcerts = concerts
        .where((concert) => DateTime.parse(concert.date).isAfter(now))
        .toList()
      ..sort((a, b) => DateTime.parse(a.date)
          .compareTo(DateTime.parse(b.date))); // Сортировка по возрастанию даты

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (pastConcerts.isNotEmpty)
          _buildSection('ПРОШЕДШИЕ КОНЦЕРТЫ', pastConcerts),
        if (upcomingConcerts.isNotEmpty)
          _buildSection('ПРЕДСТОЯЩИЕ КОНЦЕРТЫ', upcomingConcerts),
      ],
    );
  }

  Widget _buildSection(String title, List<ConcertModel> concerts) {
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
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CarouselSlider.builder(
          itemCount: concerts.length,
          itemBuilder: (context, index, realIndex) {
            final concert = concerts[index];
            final date = DateTime.parse(concert.date);
            final formattedDate = '${date.day}.${date.month}.${date.year}';

            return GestureDetector(
              onTap: () {
                context.router.push(ConcertDetailRoute(concert: concert));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.5),
                child: ProductCard(
                  imageUrl: ImageUtils.getFullImageUrl(concert.images.first),
                  title: concert.title,
                  price: '${concert.price} ₽',
                  date: formattedDate,
                  showCartButton: title.contains('ПРЕДСТОЯЩИЕ'),
                  imageHeight: 200,
                  onCartPress: title.contains('ПРЕДСТОЯЩИЕ')
                      ? () {
                          CartService().addItem(concert.uuid, 'concert').then((_) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Концерт добавлен в корзину')),
                            );
                          });
                        }
                      : null,
                ),
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
