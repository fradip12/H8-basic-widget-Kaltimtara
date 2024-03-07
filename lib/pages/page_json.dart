import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:session_one/controller/recipes_controller.dart';
import 'package:session_one/controller/resto_provider.dart';
import 'package:shimmer/shimmer.dart';

class PageJSON extends StatefulWidget {
  const PageJSON({super.key});

  @override
  State<PageJSON> createState() => _PageJSONState();
}

class _PageJSONState extends State<PageJSON> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<RecipesProvider>(context, listen: false);
    provider.getData();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipesProvider>(context);
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
            child: Consumer<RecipesProvider>(builder: (_, data, __) {
              if (data.state == ApiStatus.loading) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (_, index) {
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade200,
                      highlightColor: Colors.grey.shade300,
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    );
                  },
                );
              }
              if (data.state == ApiStatus.error) {
                return Text('Error While Getting Data....');
              }
              if (data.state == ApiStatus.success) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (_, index) {
                    final item = data.data?[index];
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        GestureDetector(
                          onTap: () {
                            provider.selectData(item);
                            Navigator.pushNamed(context, '/detail');
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            alignment: Alignment.bottomLeft,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(item?.image ?? '-'),
                              ),
                            ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.all(4.0),
                              // height: 75,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.2),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(8.0),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    item?.name ?? '-',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Row(
                                    children: List.generate(item!.rating! ~/ 1,
                                            (index) => index)
                                        .map(
                                          (e) => const Icon(
                                            Icons.star,
                                            color: Colors.orangeAccent,
                                          ),
                                        )
                                        .toList(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            (item.isFavorite ?? false)
                                ? provider.removeFavorite(item)
                                : provider.addFavorite(item);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              (item.isFavorite ?? false)
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              size: 40,
                              color: Colors.pink,
                            ),
                          ),
                        ),
                      ],
                    ).animate().fade();
                  },
                );
              }
              return const Text('Error');
            }),
          ),
        ),
      ),
    );
  }
}
