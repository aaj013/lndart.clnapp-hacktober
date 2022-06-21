import 'package:cln_grpc/cln_grpc.dart';
import 'package:clnapp/utils/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeView extends StatefulWidget {
  final AppProvider provider;

  const HomeView({Key? key, required this.provider}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController controller = ScrollController();

  bool closeTopContainer = false;

  double topContainer = 0;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 1;
    controller.addListener(() {
      double value = controller.offset / 300;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 0;
      });
    });
  }

  Widget _buildMainView({required BuildContext context}) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.48;
    return FutureBuilder<GetinfoResponse>(
        future: widget.provider.get<GRPCClient>().getinfo(),
        builder: (context, AsyncSnapshot<GetinfoResponse> snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 120),
                    opacity: closeTopContainer ? 0 : 1,
                    child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.topCenter,
                        height: closeTopContainer ? 0 : categoryHeight,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05),
                          color: const Color(0xFFBCD51C),
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  snapshot.data!.alias,
                                  style: const TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                "Available balance",
                                style: TextStyle(fontSize: 14),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              const Text(
                                "\$3,100,",
                                style: TextStyle(
                                    fontSize: 45, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Container(
                                    height: 5,
                                    width: 5,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7,
                                  ),
                                  Container(
                                    height: 3,
                                    width: 3,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        height: 55,
                                        width: 55,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.add_box_rounded,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Top Up",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.send_outlined,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Send",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                        ),
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.call_received_outlined,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Request",
                                        style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.055,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.08,
                          MediaQuery.of(context).size.height * 0.01,
                          0,
                          0),
                      child: const Text(
                        "Last Transaction",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    color: Colors.white,
                    child: ListView.builder(
                        controller: controller,
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          double scale = 1.0;
                          if (topContainer > 0.5) {
                            scale = index + 0.5 - topContainer;
                            if (scale < 0) {
                              scale = 0;
                            } else if (scale > 1) {
                              scale = 1;
                            }
                          }
                          return Opacity(
                            opacity: scale,
                            child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.053),
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 46,
                                          width: 46,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xFFEDEDE6),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Icon(
                                            Icons.shopping_bag_outlined,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Gold",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              Text(
                                                "Transaction ID $index",
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ))),
                          );
                        }),
                  )),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _buildBottomNavigation() {
    return BottomNavyBar(
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.data_usage_outlined),
          title: const Text('Info'),
          activeColor: Colors.red,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.home_filled),
          title: const Text('Home'),
          activeColor: Colors.purpleAccent,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.perm_identity),
          title: const Text('Profile'),
          activeColor: Colors.pink,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          closeTopContainer ? Colors.white : const Color(0xFFBCD51C),
      body: _buildMainView(context: context),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }
}