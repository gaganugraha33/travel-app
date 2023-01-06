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

  List<DestinationModel> destinations = [
    DestinationModel(
      id: 1,
      price: Random().nextInt(95) + 23,
      review: Random().nextInt(300) + 25,
      image: [
        '',
        '',
        '',
      ],
      name: 'Gunung Kerinci',
      description: 'Gunung Kerinci mantapp',
      category: 'popular',
      location: 'Jambi, indonesia',
      rate: 4.6,
    )
  ];
}
