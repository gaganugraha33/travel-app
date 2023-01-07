import 'package:flutter/material.dart';
import 'package:travel_app/constant/dictionary.dart';
import 'package:travel_app/model/destination_model.dart';

import '../component/bg_blur.dart';

class DetailScreen extends StatefulWidget {
  final DestinationModel destinationModel;

  const DetailScreen({
    Key? key,
    required this.destinationModel,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PageController pageController = PageController();
  int pageView = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          Dictionary.detailPlace,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(4),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            child: const Icon(
              Icons.bookmark_outline_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 5),
                          spreadRadius: 1,
                          blurRadius: 5,
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        PageView(
                          controller: pageController,
                          onPageChanged: (value) {
                            setState(() {
                              pageView = value;
                            });
                          },
                          children: List.generate(
                            widget.destinationModel.image.length,
                            (index) => Image.asset(
                              'assets/images/${widget.destinationModel.image[index]}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                if (pageController.hasClients) {
                                  pageController.animateToPage(
                                    pageView ==
                                            widget.destinationModel.image
                                                    .length -
                                                1
                                        ? 0
                                        : pageView + 1,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.only(
                                  right: 10,
                                  bottom: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.white,
                                  ),
                                  image: DecorationImage(
                                    image: widget.destinationModel.image
                                                    .length -
                                                1 !=
                                            pageView
                                        ? AssetImage(
                                            'assets/images/${widget.destinationModel.image[pageView + 1]}')
                                        : AssetImage(
                                            'assets/images/${widget.destinationModel.image[0]}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            BgBlur(
                              opacity: 0.8,
                              blur: 6,
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(
                                            widget
                                                .destinationModel.image.length,
                                            (index) => GestureDetector(
                                                  onTap: () {
                                                    if (pageController
                                                        .hasClients) {
                                                      pageController.animateToPage(
                                                          index,
                                                          duration:
                                                              const Duration(
                                                                  milliseconds:
                                                                      500),
                                                          curve:
                                                              Curves.easeInOut);
                                                    }
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: const Duration(
                                                        milliseconds: 500),
                                                    height: 5,
                                                    width: 20,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 5),
                                                    decoration: BoxDecoration(
                                                      color: pageView == index
                                                          ? Colors.white
                                                          : Colors.white
                                                              .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                )),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                widget.destinationModel.name!,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.location_on,
                                                    color: Colors.white,
                                                    size: 18,
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text(
                                                    widget.destinationModel
                                                        .location!,
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star_rounded,
                                                    color: Colors.orangeAccent,
                                                    size: 20,
                                                  ),
                                                  Text(
                                                    '${widget.destinationModel.rate}',
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '(${widget.destinationModel.review} reviews)',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TabBar(
                          labelColor: Colors.blue,
                          unselectedLabelColor: Colors.black,
                          indicatorColor: Colors.blue,
                          indicatorSize: TabBarIndicatorSize.label,
                          tabs: [
                            Tab(
                              text: Dictionary.overView,
                            ),
                            Tab(
                              text: Dictionary.review,
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                widget.destinationModel.description!,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 12,
                                  height: 1.5,
                                ),
                              ),
                            ),
                            Center(
                              child: Text(Dictionary.review),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset.zero,
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Dictionary.price,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${widget.destinationModel.price}',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextSpan(
                              text: Dictionary.person,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.confirmation_num_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                Dictionary.bookTicket,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
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
      ),
    );
  }
}
