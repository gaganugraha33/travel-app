import 'package:flutter/material.dart';
import 'package:travel_app/component/destination_slider.dart';
import 'package:travel_app/constant/dictionary.dart';
import 'package:travel_app/model/destination_model.dart';
import 'package:travel_app/pages/detail_screen.dart';
import '../component/destination_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home,
    Icons.search,
    Icons.confirmation_number_outlined,
    Icons.bookmark_outline_rounded,
    Icons.person_outline_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leadingWidth: 120,
          leading: Row(
            children: [
              const Icon(
                Icons.location_on,
                color: Colors.black,
              ),
              Text(
                Dictionary.indonesia,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  width: 1,
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: Container(
                        height: 6,
                        width: 6,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.grey.shade200,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Dictionary.popularPlace,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    Dictionary.seeAll,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: List.generate(
                    destinations.length,
                    (index) => Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(left: 10, right: 10)
                          : const EdgeInsets.only(right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                  destinationModel: destinations[index]),
                            ),
                          );
                        },
                        child: DestinationSlider(
                          destinationModel: destinations[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Dictionary.recomendationForYou,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    Dictionary.seeAll,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Column(
                  children: List.generate(
                    destinations.length,
                    (index) => Padding(
                      padding: index == 0
                          ? const EdgeInsets.only(top: 15, bottom: 15)
                          : const EdgeInsets.only(bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                  destinationModel: destinations[index]),
                            ),
                          );
                        },
                        child: DestinationList(
                          destinationModel: destinations[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
        extendBody: false,
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        icons.length,
                        (index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPage = index;
                            });
                          },
                          child: Icon(
                            icons[index],
                            color: selectedPage == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 5,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
