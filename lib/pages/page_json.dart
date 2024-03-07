import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_one/controller/resto_provider.dart';
import 'package:session_one/models/restaurant_models.dart';
import 'package:session_one/pages/page_detail_resto.dart';
import 'package:session_one/services/api_services.dart';

class PageJSON extends StatefulWidget {
  const PageJSON({super.key});

  @override
  State<PageJSON> createState() => _PageJSONState();
}

class _PageJSONState extends State<PageJSON> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<RestoProvider>(context, listen: false);
    provider.getDataResto();
  }

  @override
  Widget build(BuildContext context) {
    final restoProvider = Provider.of<RestoProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Restaurant Apps'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/cart'),
          child: const Icon(
            Icons.shopping_bag,
            color: Colors.black,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Consumer<RestoProvider>(builder: (_, dataP, __) {
              if (dataP.state == ApiStatus.loading) {
                return const CircularProgressIndicator();
              }
              if (dataP.state == ApiStatus.success) {
                return ListView.builder(
                  itemCount: dataP.listResto?.length,
                  itemBuilder: (_, index) {
                    final data = dataP.listResto![index];
                    return GestureDetector(
                      onTap: () {
                        ///  Publisher Action
                        restoProvider.selectResto(data);
                        // Codes untuk Navigate ke pages baru
                        Navigator.pushNamed(
                          context,
                          '/detail',
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 12),
                        height: 75,
                        padding: const EdgeInsets.all(12),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 4,
                              child: Row(
                                children: [
                                  Image.network(
                                    data.imageUrl ?? '',
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
                                          data.name ?? '-',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          data.location ?? '-',
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.orangeAccent,
                                    ),
                                    Text(data.rating ?? '0.0'),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  if (data.isFavorite ?? false) {
                                    restoProvider.removeFavorite(data);
                                  } else {
                                    restoProvider.addFavorite(data);
                                  }
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: (data.isFavorite ?? false)
                                      ? Colors.pink
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              return Text('Error');
            }),
          ),
        ),
      ),
    );
  }
}
