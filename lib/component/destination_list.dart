import 'package:flutter/material.dart';
import 'package:travel_app/constant/dictionary.dart';
import 'package:travel_app/model/destination_model.dart';

class DestinationList extends StatelessWidget {
  final DestinationModel destinationModel;

  const DestinationList({
    Key? key,
    required this.destinationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.fromLTRB(5, 5, 10, 5),
      child: Row(
        children: [
          Container(
            height: 75,
            width: 75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/${destinationModel.image[0]}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  destinationModel.name!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.black,
                      size: 16,
                    ),
                    Text(
                      destinationModel.location!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.yellow,
                      size: 16,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '${destinationModel.rate!}',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              )),
                          TextSpan(
                              text: ' (${destinationModel.review} reviews)',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: '\$${destinationModel.price!}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        )),
                    TextSpan(
                        text: Dictionary.person,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
