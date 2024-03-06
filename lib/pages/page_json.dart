import 'package:flutter/material.dart';
import 'package:session_one/models/restaurant_models.dart';
import 'package:session_one/services/api_services.dart';

class PageJSON extends StatefulWidget {
  const PageJSON({super.key});

  @override
  State<PageJSON> createState() => _PageJSONState();
}

class _PageJSONState extends State<PageJSON> {
  int indexBody = 0;

  void changeIndex(int value) {
    setState(() {
      indexBody = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                child: Text('Ini Drawer Header'),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Restaurant Apps'),
          bottom: TabBar(
            tabs: [
              Icon(Icons.home),
              Icon(Icons.message),
            ],
          ),
        ),
        body: indexBody == 0
            ? Container(
                child: Text('Home 1'),
              )
            : TabBarView(
                children: [
                  Text('Home 2'),
                  Center(
                    child: FutureBuilder<List<RestaurantModels>>(
                      future: getDataRestaurant(),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          return ListView.builder(
                            itemCount: snapshot.data?.length,
                            itemBuilder: (_, index) {
                              final data = snapshot.data?[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 75,
                                  padding: EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.white70,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 2,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 4,
                                        child: Row(
                                          children: [
                                            Image.network(
                                              data?.imageUrl ?? '',
                                            ),
                                            SizedBox(
                                              width: 12,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data?[index]
                                                            .name ??
                                                        '-',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    snapshot.data?[index]
                                                            .location ??
                                                        '-',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.orangeAccent,
                                              ),
                                              Text(data?.rating ?? '0.0'),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        return Text('GET DATA RESTAURANT');
                      },
                    ),
                  ),
                ],
              ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: changeIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'List',
            )
          ],
        ),
      ),
    );
  }
}
