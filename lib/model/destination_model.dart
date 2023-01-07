import 'dart:math';

class DestinationModel {
  final int? id, price, review;
  final List<String> image;
  final String? name, description, category, location;
  final double? rate;

  DestinationModel({
    required this.id,
    required this.price,
    required this.review,
    required this.image,
    required this.name,
    required this.description,
    required this.category,
    required this.location,
    required this.rate,
  });
}

List<DestinationModel> destinations = [
  DestinationModel(
    id: 1,
    price: Random().nextInt(95) + 23,
    review: Random().nextInt(300) + 25,
    image: [
      'bali pagoda.jpg',
      'bali pagoda.jpg',
    ],
    name: 'Bratan Lake',
    description:
        'Upcountry lake with a famed waterfront Hindu temple, Ulun Danu Beratan, plus boating & restaurants.',
    category: 'popular',
    location: 'Bali, indonesia',
    rate: 4.6,
  ),
  DestinationModel(
    id: 2,
    price: Random().nextInt(95) + 23,
    review: Random().nextInt(300) + 25,
    image: [
      'gunung bromo.jpg',
    ],
    name: 'Bromo Mountain',
    description:
        'The Bromo, or Mount Bromo is an active somma volcano and part of the Tengger mountains, in East Java, Indonesia. At 2,329 meters it is not the highest peak of the massif, but the most famous.',
    category: 'popular',
    location: 'Malang, indonesia',
    rate: 4.6,
  ),
];
