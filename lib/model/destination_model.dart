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
  DestinationModel(
    id: 3,
    price: Random().nextInt(95) + 21,
    review: Random().nextInt(300) + 18,
    image: [
      'danau toba.jpeg',
    ],
    name: 'Lake Toba',
    description:
        'Lake Toba is a large natural lake in North Sumatra, Indonesia, occupying the caldera of a supervolcano.',
    category: 'popular',
    location: 'Sumatra Utara, indonesia',
    rate: 4.5,
  ),
  DestinationModel(
    id: 4,
    price: Random().nextInt(95) + 21,
    review: Random().nextInt(300) + 18,
    image: [
      'pantai kelingking.jpg',
    ],
    name: 'Kelingking Beach',
    description:
        'Kelingking Beach is one of the most famous spot of Nusa Penida. Major travel sites use its photo to advertise Bali and even sometimes Indonesia.',
    category: 'popular',
    location: 'Bali, indonesia',
    rate: 4.8,
  ),
  DestinationModel(
    id: 5,
    price: Random().nextInt(95) + 21,
    review: Random().nextInt(300) + 18,
    image: [
      'raja ampat.jpeg',
    ],
    name: 'Raja Ampat',
    description:
        'The Raja Ampat Islands are an Indonesian archipelago off the northwest tip of Bird’s Head Peninsula in West Papua. Comprising hundreds of jungle-covered islands, Raja Ampat is known for its beaches and coral reefs rich with marine life. Ancient rock paintings and caves are on Misool Island, while the crimson bird of paradise lives on Waigeo Island. Batanta and Salawati are the archipelago’s other main islands.',
    category: 'popular',
    location: 'Papua, indonesia',
    rate: 4.4,
  ),
];
